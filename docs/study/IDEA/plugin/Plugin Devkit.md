# Plugin Devkit api

**Groups（组）**：
通常是用于对相关的功能或操作进行分类和组织的集合。比如可以将一组针对特定领域的操作归为一个组，以便更好地管理和展示在 IDE 的界面中。例如，可以有一个“代码分析”组，里面包含各种与代码分析相关的操作。
**Actions（动作）**：
代表具体的可执行操作。例如打开一个特定的窗口、执行一个代码检查、运行一个特定的工具等。每个动作通常与一个具体的功能相关联，用户可以通过触发这些动作来实现特定的目的。
**Anchor（锚点）**：
可以理解为一个固定的参考点或定位点。在插件开发中，可能用于确定界面元素的相对位置，或者作为某些操作的起始或结束参考位置。比如在布局界面时，可以将一个组件锚定到特定的位置，以便在 IDE 窗口大小变化等情况下保持相对稳定的位置关系。

## 标准操作组和操作符含义

| 操作组API                                     | 操作组描述 | 操作API                                             | 操作描述 |
| ------------------------------------------ | ----- | ------------------------------------------------- | ---- |
| $LRU(Recent Projects)                      |       | RecentProjectListGroup(Reopen Project)            |      |
|                                            |       | ManageRecentProjects(Manage Projects)             |      |
| ActivateToolWindowActions                  |       | ActivateFindToolWindow(Find)                      |      |
|                                            |       | ActivateMeetNewUIToolWindow(Configure the New Ui) |      |
|                                            |       | ActivateRunToolWindow(Run)                        |      |
|                                            |       | ActivateHierarchyToolWindow(Hierarchy)            |      |
|                                            |       | ActivateDebugToolWindow(Debug)                    |      |
|                                            |       | ActivateAIAssistantToolWindow(AI Assistant)       |      |
|                                            |       | ActivateCommitToolWindow(Commit)                  |      |
| ActiveToolwindowGroup(Active Tool Windows) |       | HideActiveWindow                                  |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
|                                            |       |                                                   |      |
