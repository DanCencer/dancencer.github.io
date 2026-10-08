---
# Leave the homepage title empty to use the site title
title: ''
summary: ''
date: 2026-10-08
type: landing

sections:
  - block: resume-biography-3
    content:
      username: me
      text: ''
      button:
        text: Download CV
        url: uploads/resume.pdf
      headings:
        about: ''
        education: ''
        interests: ''
    design:
      background:
        gradient_mesh:
          enable: true
      name:
        size: md
      avatar:
        size: medium
        shape: circle

  - block: markdown
    content:
      title: 'What I Do'
      subtitle: ''
      text: |-
        I build the systems that turn athlete data into better decisions. My work sits at the intersection of sport science, strength and conditioning, and data analytics: integrating GPS, force plate, sprint, and strength data into individualized, coach-facing information that staff can actually act on.

        My research interests include individualized athlete monitoring, Bayesian approaches to small-sample performance data, and the role of leadership and culture in high-performance environments.
    design:
      columns: '1'

  - block: collection
    id: papers
    content:
      title: Featured Publications
      filters:
        folders:
          - publications
        featured_only: true
    design:
      view: article-grid
      columns: 2

  - block: collection
    content:
      title: Recent Publications
      text: ''
      filters:
        folders:
          - publications
        exclude_featured: false
    design:
      view: citation

  - block: collection
    id: talks
    content:
      title: Recent & Upcoming Talks
      filters:
        folders:
          - events
    design:
      view: card
---
