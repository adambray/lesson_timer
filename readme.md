# Lesson Plan Timer

This script reads a lesson plan, and auto computes the cumulative time for
each section. It then creates two new files:

* `lesson_plan_timed.md` - the original plan, with updated headers including cumulative time
* `lesson_plan_summary.md` - just the new headers including cumulative time

## Usage

```bash
$ ruby timing.rb sample.md
# or add your start time
$ ruby timing.rb sample.md 9:00
```

### Input
This script expects your lesson plan to include headers formatted like so:

```markdown
## Intro (10 minutes)
```

The parsing is quite forgiving.  You really just need a number to follow the open paren.
```markdown
## Intro (10 min)
## Intro (10 m)
## Intro (10)
```


The headers can be any level header.

### Output

Given a lesson plan like:

```markdown
# Sample Lesson

## Intro (5 minutes)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel pellentesque
ipsum. Nullam sodales nec diam et placerat. Fusce egestas augue ut elit
tincidunt, a dignissim mauris sagittis.

## Difficult Material (70 minutes)

Etiam est mauris, tempus vel arcu eu, dictum elementum nisl. Morbi a mi ante.
Pellentesque eu cursus sem, eu convallis augue. Morbi erat nisl, cursus eu
lobortis eu, suscipit sed justo.

## Closing (10 minutes)

Donec dolor justo, facilisis sit amet mattis a, fringilla quis velit. Nullam
placerat erat sed tempus aliquam. Integer et efficitur neque.
```

The outputted files will look like:

`lesson_plan_summary.md`:
```markdown
## Intro (5 minutes - 00:05)
## Difficult Material (70 minutes - 01:15)
## Closing (10 minutes - 01:25)
```

`lesson_plan_timed.md`
```markdown
# Sample Lesson

## Intro (5 minutes - 00:05)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel pellentesque
ipsum. Nullam sodales nec diam et placerat. Fusce egestas augue ut elit
tincidunt, a dignissim mauris sagittis.

## Difficult Material (70 minutes - 01:15)

Etiam est mauris, tempus vel arcu eu, dictum elementum nisl. Morbi a mi ante.
Pellentesque eu cursus sem, eu convallis augue. Morbi erat nisl, cursus eu
lobortis eu, suscipit sed justo.

## Closing (10 minutes - 01:25)

Donec dolor justo, facilisis sit amet mattis a, fringilla quis velit. Nullam
placerat erat sed tempus aliquam. Integer et efficitur neque.
```

If you pass a start time, the output will look like this:

```
$ ruby timing.rb sample.md 10:00
```

`sample_summary.md:`
```markdown
## Intro (5 minutes - 10:05)
## Difficult Material (70 minutes - 11:15)
## Closing (10 minutes - 11:25)
```
