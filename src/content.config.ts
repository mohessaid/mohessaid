import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const blog = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/blog" }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    description: z.string().optional(),
    draft: z.boolean().optional().default(false),
    lang: z.enum(['ar', 'en']).default('ar'),
    tags: z.array(z.string()).optional().default([]),
  }),
});

const projects = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/projects" }),
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    statusLabel: z.string(),
    statusColor: z.string(),
    startDate: z.string(),
    endDate: z.string(),
    lang: z.enum(['ar', 'en']).default('ar'),
    url: z.string().url().optional(),
    github: z.string().url().optional(),
    tech: z.array(z.string()).optional().default([]),
    draft: z.boolean().optional().default(false),
  }),
});

const about = defineCollection({
  loader: glob({ pattern: "**/*.{md,mdx}", base: "./src/content/about" }),
  schema: z.object({
    title: z.string(),
    bio: z.string().optional(),
  }),
});

export const collections = { blog, projects, about };
