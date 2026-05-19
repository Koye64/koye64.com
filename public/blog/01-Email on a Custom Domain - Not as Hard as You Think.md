# Email on a Custom Domain

Not as hard as you think!

<!--toc:start-->
- [Email on a Custom Domain](#email-on-a-custom-domain)
  - [Background](#background)
  - [Idea: DNS?](#idea-dns)
  - [Cloudflare](#cloudflare)
  - [Gmail](#gmail)
<!--toc:end-->

## Background

Setting up this website and migrating my socials to Bluesky got me thinking a 
lot more than usual about my personal domain. That's my name, and it ends in 
*.com*! It felt very reminiscent of the old internet where everyone and their 
cat had a website and a blog.

Wanting to reignite that sort of Space Jam-y, old-web spark, I decided I should 
harness that energy and create my own, custom email address. I wanted this 
setup to be as painless as possible, so I enacted the condition that I will not 
be hosting a personal mail server unless *absolutely necessary*.

One small problem: How exactly am I supposed to do that?

## Idea: DNS?

It sounds so simple, right? Just take the incoming mail and push it somewhere 
else.

The DNS "Mail Exchange" record (MX) points email to a mail server. Perhaps I 
can just... Point it to Gmail?

Let's see what that would look like:

| name: | record type: | priority: | value: |
| --------------- | --------------- | --------------- | --------------- |
| @ | MX | 10 | gmail-smtp-in.l.google.com |

... yeah, I'm not going to be the first to tell you that this approach has 
issues, not the least of which being that Gmail likely doesn't host a single 
user with the address *literallyanything@yourdomain.com*. While we *are* 
technically routing all our email traffic to Gmail through our domain, it has 
no idea what to do with it since the "to" address is just some random user who 
both doesn't exist and apparently resides on some random domain (ours).

We are on the right track, though; all we need is something to forward our 
messages to the correct email address.

## Cloudflare

Obviously a pure DNS solution isn't going to work. I'm not really in the mood 
to set up an entire mail server just for myself, so that's off the table as 
well. I *could* see myself writing a program to rewrite the email header and 
send it to the correct address, but that's only barely a step removed from just 
hosting an email server.

Perhaps the service I've been looking for has been right under my nose this 
whole time?

---

You should know the drill by now, Cloudflare will do literally everything for 
you.

If you use cloudflare as your domain provider, you've likely noticed a button 
called "Email" on your domain's dashboard. You may have let this

## Gmail

