#!/usr/bin/env bash
# site_cleanup.sh: strip HugoBlox demo content and set up Dan's homepage.
# Run from the repo root:  bash site_cleanup.sh
set -e

if [ ! -f hugoblox.yaml ]; then
  echo "Run this from the repo root (the folder containing hugoblox.yaml)."; exit 1
fi

# ---- 1. Delete demo content (keeps each section's _index.md) ----
rm -rf content/projects/pandas content/projects/pytorch content/projects/scikit
rm -rf content/publications/conference-paper content/publications/journal-article content/publications/preprint
find content/blog -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
rm -rf content/events/example
rm -rf content/slides
rm -rf content/courses

# ---- 2. Homepage ----
cat > content/_index.md <<'MD'
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
MD

# ---- 3. Navigation menu ----
cat > config/_default/menus.yaml <<'MD'
# Navigation Links
#   `url: /#id` jumps to a homepage block with that `id`.
#   `weight` sets the order.

main:
  - name: Bio
    url: /
    weight: 10
  - name: Publications
    url: /#papers
    weight: 11
  - name: Talks
    url: /#talks
    weight: 12
  - name: Experience
    url: experience/
    weight: 20
  - name: Projects
    url: projects/
    weight: 30
MD

# ---- 4. Experience page (skills/awards/languages blocks removed) ----
cat > content/experience.md <<'MD'
---
title: 'Experience'
date: 2026-10-08
type: landing

design:
  spacing: '5rem'

sections:
  - block: resume-experience
    content:
      username: me
    design:
      date_format: 'January 2006'
      is_education_first: false
---
MD

rm -f site_cleanup.sh
echo "Done. Review the changes, then commit and push."
