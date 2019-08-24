# Grammar Filename Analysis

## General naming patterns

### For shells

- Filename is same as root map or topic type name except:
  - basemap
  - basetopic
  - classifyMap (integrates classification domain)
  - machineryTask (adds machinery-specific constraints)
  - generalTask (unconstrained task)

### For Modules

Module types:

- topic type module
- map type module
- element domain module
- attribute domain module
- constraint module
- base module used from topic or map modules

For DTDs, ".dtd" is for shells, ".ent" for entity modules, ".mod" for declaration modules.

#### Topic type pattern 

- {topicname}Mod.rng
- {topicname}.mod

#### Map type pattern

- {mapname}Mod.rng
- {mapname}.mod

#### Element domain name pattern

Domains have a "long name" and a "short name", e.g., "hightlight" and "hi". The long name is used for the filename, while the short name is used for pattern names and in @domains values.

- {longname}Domain.rng
- {longname}Domain.ent
- {longname}Domain.mod

#### Attribute domain name pattern

- {attname}AttDomain.rng
- {attname}AttDomain.ent
- (No .mod file for attribute domains)

#### Constraint domain name pattern

Constraints are given a name that reflects the nature of the constraint and the element type or attribute being constrained, e.g. "strictTaskbodyConstraintMod.rng".

For a given constrained element type there should (must) only be a single module that applies all constraints to that element type. This means that there cannot be a simple mapping from e.g., element type names to constraint module names but the names must be a bit more creatively named, depending on the constraints to be applied.

Pattern is:

- {constraintname}{constrainedElementType}ConstraintMod.rng
- {constraintname}{constrainedElementType}Constraint.mod
- (no .ent file for constraint modules)

#### Included base module names

There is no consistent pattern in the naming of base modules, although "{name}DeclMod.rng" and "{name}Decl.mod" are the most consistent.

## Module Name Exceptions

- commonElements (should be "commonElementsDecl" to be consistent with other base modules)
- tblDecl (should be "tableDecl" to reflect general principle of using full element type names)
- topicDefn.ent (should be topic.ent or should be omitted as for map)
- There is no map.ent (should be created if topic.ent is retained)
- glossary.* is obsolete (replaced by glossentry.*)

## Corrections/Refactorings of Modules

- Rename commontElements.* to commonElementsDecl.*
- Rename tblDecl.* to tableDecl.*
- Define separate tableDecl.ent for DTD use
- Rename topicDefn.ent to topic.ent
- Create map.ent to hold element name entities for map.mod
- All included modules should be referenced from shells, meaning no Mod or .mod/.ent file should ever include another module.
  - This enables direct constraint of base elements within references to these modules from RNG shells
- Redefine table pattern/parameter entity names to follow conventions from other modules (e.g., ".cnt" for patterns that contribute to larger content models)
- Remove glossary.*




















