---
name: Create user request template
about: For requesting a account on our clutser "cookie"
title: "[User Admin]"
labels: ''
assignees: Milokita

---

body:
    -   type: checkboxes
        id: before-posting
        attributes:
            label: "⚠️ Before posting ⚠️"
            description: All conditions are **required**. Your issue can be closed if these are checked incorrectly.
            options:
                -   label: This is a **bug**, not a question or an enhancement.
                    required: true
                -   label: I've [searched for similar issues](https://github.com/nextcloud/android/issues) and didn't find a duplicate.
                    required: true
                -   label: I've written a clear and descriptive title for this issue, not just "Bug" or "Crash".
                    required: true
                -   label: I agree to follow Nextcloud's [Code of Conduct](https://nextcloud.com/contribute/code-of-conduct/).
                    required: true
    -   type: textarea
        id: repro-steps
        attributes:
            label: Steps to reproduce
            description: |
                What are the steps to reproduce this issue? Please be as specific as possible.
                If you can't reproduce it, please add an explanation.
            placeholder: |
                1.
                2.
                3.
        validations:
            required: true
    -   type: textarea
        id: expected-behaviour
        attributes:
            label: Expected behaviour
            description: Tell us what should happen.
        validations:
            required: true
    -   type: textarea
        id: actual-behaviour
        attributes:
            label: Actual behaviour
            description: Tell us what happens instead, as detailed as possible.
        validations:
            required: true
