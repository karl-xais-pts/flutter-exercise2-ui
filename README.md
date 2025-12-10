# Flutter Interview UI Coding Exercise

This exercise is designed to help us understand **how you approach professional Flutter app development**, including code organization, widget design, and code quality.

You do **not** need to achieve everything in this exercise, but please write clean, well-reasoned, readable code and explain the tradeoffs you make.

---

## 🎯 Objectives

By the end of this exercise, we want to see:

1. How you structure and refactor (messy) Flutter code.
2. Whether you think in terms of **UI composition**, **state management**, and **clean architecture**.
3. How you handle **standard programming logic** and **complexity reduction**.

---

## 🧩 Task 1 — Refactor and Simplify the UI

In `main.dart`, you'll find an intentionally **overcomplicated code structure**.

### ✅ Your job:
- Extract repetitive or complex UI parts into **separate widgets** (e.g., `ItemCard`).
- Move any business logic (fetching, parsing, error handling, etc.) into appropriate layers (e.g. a `DataService` class).
- Reduce the size of the widget’s `build()` method, and make the code easier to read.

**Optional discussion points** if live:
- How would you scale this to support multiple screens?
- How do you test your widgets or business logic?

## ⚡️ Task 2 — Optional State Management Refactor

If you are comfortable with a Flutter state management library (e.g., Provider, Riverpod, Bloc, MobX), refactor your UI state to use it instead of `setState()`.

Explain briefly:
- Why you chose that approach.
- How it improves testability or scalability.

---

## 🧠 Evaluation Criteria

| Area | What we’re looking for |
|------|------------------------|
| **Code structure** | Clean, modular, and consistent organization |
| **Readability** | Clear naming, comments, and simple logic flow |
| **Flutter knowledge** | Understanding of widgets, state, and build lifecycles |
| **Performance & correctness** | Efficient use of lists, builds, and async code |
| **Refactoring reasoning** | Can justify design choices and complexity trade-offs |

---

## ✅ Extras (Optional)

If you have time or want to showcase additional strengths:
- Add simple theming (dark/light mode).
- Write a widget or unit test.
- Add a loading indicator or error UI for the Data Fetch button.

---

**Good luck, and have fun!**
Our goal is not to see how you *think through problems* and *improve code quality in a profressional setting*.