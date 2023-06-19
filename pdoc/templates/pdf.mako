<%
    import re
    import pdoc
    from pdoc.html_helpers import to_markdown

    def link(dobj: pdoc.Doc):
        name = dobj.qualname + ('()' if isinstance(dobj, pdoc.Function) else '')
        if isinstance(dobj, pdoc.External):
            return name
        url = dobj.url_md(relative_to=module, link_prefix=link_prefix,
                   top_ancestor=not show_inherited_members)
        return f'[{name}]({url} "{dobj.refname}")'

    def _to_md(text, module):
        text = to_markdown(text, docformat=docformat, module=module, link=link)
        # Setext H2 headings to atx H2 headings
        text = re.sub(r'\n(.+)\n-{3,}\n', r'\n## \1\n\n', text)
        # Convert admonitions into simpler paragraphs, dedent contents
        def paragraph_fmt(m):
            sub = re.sub('\n {,4}', '\n', m.group(4))
            return f'{m.group(2)}**{m.group(3)}:** {sub}'
        text = re.sub(r'^(?P<indent>( *))!!! \w+ \"([^\"]*)\"(.*(?:\n(?P=indent) +.*)*)',
                      paragraph_fmt, text, flags=re.MULTILINE)
        return text

    def subh(text, level=2):
        # Deepen heading levels so H2 becomes H4 etc.
        return re.sub(r'\n(#+) +(.+)\n', fr'\n{"#" * level}\1 \2\n', text)
%>

<%def name="title(level, string, id=None)">
    <% id = f' {{#{id}}}' if id is not None else '' %>
${('#' * level) + ' ' + string + id}
</%def>

<%def name="funcdef(f)">
<%
    params = f.params(annotate=show_type_annotations)
    returns = show_type_annotations and f.return_annotation() or ''
    if returns:
        returns = ' \N{non-breaking hyphen} ' + returns
%>
${'```python'}
%if params:
${f.funcdef()} ${f.name}(
    ${',\n    '.join(params)}
)${returns}
%else:
${f.funcdef()} ${f.name}()${returns}
%endif
${'```'}
</%def>

<%def name="classdef(c)">
<% params = c.params(annotate=show_type_annotations) %>

${'```python'}
%if params:
class ${c.name}(
    ${',\n    '.join(params)}
)
%else:
class ${c.name}
%endif
${'```'}
</%def>

<%def name="vartype(v)">
<% annot = show_type_annotations and v.type_annotation() or '' %>
%if annot:
Type: `${annot}`
%endif
</%def>

---
# Display h3 headings
toc_max_heading_level: 3
sidebar_label: 'Documentation'
description: 'Documentation'
hide_title: true
---

% for module in modules:
<%
    submodules = module.submodules()
    variables = module.variables(sort=sort_identifiers)
    functions = module.functions(sort=sort_identifiers)
    classes = module.classes(sort=sort_identifiers)

    def to_md(text):
        return _to_md(text, module)
%>
${title(2, ('Namespace' if module.is_namespace else 'Module') + f' `{module.name}`', module.refname)}
${module.docstring | to_md}

% if submodules:
${title(2, 'Sub-modules')}
    % for m in submodules:
* [${m.name}](#${m.refname})
    % endfor
% endif

% if variables:
${title(2, 'Variables')}
    % for v in variables:
${title(3, f'Variable `{v.name}`', v.refname)}
${vartype(v)}
${v.docstring | to_md, subh}
    % endfor
% endif

% if functions:
    % for f in functions:
${title(2, f'Function `{f.name}`', f.refname)}

${funcdef(f)}

${'<details>'}
  ${'<summary>Description</summary>\n'}
${f.docstring | to_md, subh}
${'</details>\n'}
    % endfor
% endif

% if classes:
    % for cls in classes:
${title(2, f'Class `{cls.name}`', cls.refname)}

${classdef(cls)}

${'<details>'}
  ${'<summary>Description</summary>\n'}
${cls.docstring | to_md, subh}

<%
    class_vars = cls.class_variables(show_inherited_members, sort=sort_identifiers)
    static_methods = cls.functions(show_inherited_members, sort=sort_identifiers)
    inst_vars = cls.instance_variables(show_inherited_members, sort=sort_identifiers)
    methods = cls.methods(show_inherited_members, sort=sort_identifiers)
    mro = cls.mro()
    subclasses = cls.subclasses()
%>
        % if mro:
${title(4, 'Ancestors')}
            % for c in mro:
* [${c.refname}](#${c.refname})
            % endfor
        % endif

        % if subclasses:
${title(4, 'Descendants')}
            % for c in subclasses:
* [${c.refname}](#${c.refname})
            % endfor
        % endif
${'</details>\n'}

        % if class_vars:
${title(3, 'Class variables')}
            % for v in class_vars:
${title(4, f'Variable `{v.name}`', v.refname)}
${vartype(v)}
${v.docstring | to_md, subh}
            % endfor
        % endif

        % if inst_vars:
${title(3, 'Instance variables')}
            % for v in inst_vars:
${title(4, f'Variable `{v.name}`', v.refname)}
${vartype(v)}
${v.docstring | to_md, subh}
            % endfor
        % endif

        % if static_methods:
            % for f in static_methods:
${title(3, f'`Method {f.name}`', f.refname)}

${funcdef(f)}

${'<details>'}
  ${'<summary>Description</summary>\n'}
${f.docstring | to_md, subh}
${'</details>\n'}
            % endfor
        % endif

        % if methods:
            % for f in methods:
${title(3, f'Method `{f.name}`', f.refname)}

${funcdef(f)}

${'<details>'}
  ${'<summary>Description</summary>\n'}
${f.docstring | to_md, subh}
${'</details>\n'}
            % endfor
        % endif
    % endfor
% endif

##\## for module in modules:
% endfor
