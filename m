Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD950CA0EE4
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 15:36:08 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.78542.1755531359452730594
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 08:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=Bdh67IwY;
 spf=pass (domain: criticallink.com, ip: 209.85.219.175, mailfrom: jcormier@criticallink.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e934c8f9757so1278827276.2
        for <meta-arago@lists.yoctoproject.org>; Mon, 18 Aug 2025 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755531358; x=1756136158; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QphlBXgpW6gvjeOx/3w7bIKgyvnKR7xpjBcSsk0y0Lg=;
        b=Bdh67IwYeTfj1RN0boh21oDGENV6wirLpfsQCO4eOw8gGMA27XRRYMLSUteP3WN8i7
         ugyfwFhp/EJqTWGeZ8ZT82kkcj4aZTLTuTla2xn5SU7n8IPy3z/vHuyUFdN7/IpnOwUP
         qCmnvoHJ/+QfMOKf+Uv732eV+RPr1YzXvyZB3TsCuPH/V2gOFfeVBAN2+IFA/u3yXATt
         X5kItqget5O5ziXCqWJ6e/3FdBZoaMLZQjBA/fnuGk2UXM9Vg8N7ml//Bqb5QTqZJuVb
         gguVzQOQiVoJ2VCvcjpq5zxE1EM0BRPzx4QSGfYzi6DWBCoKfzpkPB2d+95Cd1gjQ7ZC
         rhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531358; x=1756136158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QphlBXgpW6gvjeOx/3w7bIKgyvnKR7xpjBcSsk0y0Lg=;
        b=EHIHatXZrlaqszRGLRyZSTjq+haGgi6ZVK0kykTZDpC+RuyNpKlxgXI4EfLWUlXeZh
         NENnRrKJgXIZdpfZf1YLtkIXReIVnGh+tx0fq8xDV+Hq6UExD5MuiRi7nLTbanxchm5k
         f475L3gSKPoFTZpwQ0a1e18A78Bd0wZ3Z1BzUM05RcUUCIxB+o0qIwlK8e2y2w5QjfJ+
         JcCdUOPQ8DCNDdPIxhdPI/EUvIMKbgl3vr3gJDFSDhYsP2g5kHYHGthbm0DmdqfaiKL8
         6rDrYvXqXoEV99tmN3XNj1Uq+X+4f6lGX7k2p2VilTKQ7XhjEYby0uVaI/ii7Jbtz+Xj
         0Tuw==
X-Forwarded-Encrypted: i=1; AJvYcCXGU8vGa5VL8YzJG8i2vdrDcWbnId2jlKl+q/rJdXSRTJrNuwGwzBGwYo4oS9k3u73aUjOXqiMsw8HX@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxYJlRRuQQudZDuqg43X7SHWfTSdrmrgUuaIlcV2vo5m7BGyX09
	vR/El3nYGz0U4p1PrvlRurVikciOLS+8Vulhc8/ZJDei1cY79AdZyFsCASr3I5z+zQMDw2CoEh0
	hFtTC62RBb7F+u4tKY8SZPYTZQsMmHf4EQ9NAnx1t
X-Gm-Gg: ASbGncsN3dv1iu0AR1nTPj3UrX2Qx0i9lng5vudefCS4XA6KtSZV6eVkWxtf3dfdJ/3
	1Pe9tqdYX581pLvrafLn+8hqOA5HS9x+VhUl8SF4x9gV1IZrcAiGMBGkeEMI6nQxqx4P/gGuN14
	1Tr3Z4MecRb0CBHkbQ2xqBa+VFE6KbQfDspmjwDrR8UxFpGvYkfPb6KWsv4wKlFEftry/q0S5i5
	PM8OA==
X-Google-Smtp-Source: AGHT+IG1lioAD0msWumnXW4TwrDMSgpjvaA1UKFyxW6KVq3xVYlCG43R1Trv3z/KtDD3D5NFtLEE4pCU8ZPr/AGTPcM=
X-Received: by 2002:a05:6902:2684:b0:e94:2e51:7792 with SMTP id
 3f1490d57ef6-e942e517956mr5055536276.20.1755531358363; Mon, 18 Aug 2025
 08:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250814232955.1559040-1-rs@ti.com> <20250814232955.1559040-3-rs@ti.com>
 <CADL8D3YwWvVtodQehpL9aL_ytqnjOEF26JRw+KPpjFDdFmB5Og@mail.gmail.com>
 <DC37XD2JXTIN.2JYXTQ0KPHPKB@ti.com> <CADL8D3aDf=1M1KjeECNV7ovR8DabE3LrkC6vSR3b4nB+Xg1dFA@mail.gmail.com>
 <DC3A7RJ5NTC8.3FJ3D9WFG8J54@ti.com>
In-Reply-To: <DC3A7RJ5NTC8.3FJ3D9WFG8J54@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 18 Aug 2025 11:35:46 -0400
X-Gm-Features: Ac12FXwdb5LSMoDHeEnhneWQkSCSh1E94xm_U5eMlcMEmPQNl3vOu2YFy9pno3Q
Message-ID: <CADL8D3YnXfi9TeiDBrEY5D+eiah8gu-gGKM8LAwoF-StUbRu3g@mail.gmail.com>
Subject: Re: [meta-arago] [oe-layersetup][PATCH 2/2] kas: regenerate all
 configs to include bitbake
To: Randolph Sapp <rs@ti.com>
Cc: reatmon@ti.com, denis@denix.org, a-christidis@ti.com, 
	meta-arago@lists.yoctoproject.org, nm@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 Aug 2025 15:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16490

On Fri, Aug 15, 2025 at 4:25=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:
>
> On Fri Aug 15, 2025 at 2:48 PM CDT, Jon Cormier wrote:
> > On Fri, Aug 15, 2025 at 2:38=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote=
:
> >> On Fri Aug 15, 2025 at 10:25 AM CDT, Jon Cormier wrote:
> >> > Is there any simple guide on using kas for the TI builds?
> >> >
> >> > If I try on ubuntu 24.04, what the kas documentation says, I get a
> >> > very minimal and unhelpful failure... With seemingly no way to turn =
on
> >> > additional logging.  The build directory is empty as well.
> >>
> >> Their documentation is enough with this patch. Prior to this patch we
> >> would not
> >> clone the bitbake repo, and the first part of the build is running a
> >> script in
> >> oe-core that is supposed to interact with bitbake. This generates the
> >> cryptic
> >> 'Command "/tmp/tmp_qqetik6/get_bb_env/work/build" failed with error 1'
> >> error
> >> message.
> >>
> > Makes sense, i should have read the whole patch set before commenting
> >
> > With kas-container, Is there a way I'm missing to specify MACHINE=3D<>
> > without modifying local.conf or using "shell"?
>
> There may be other documented options, but I personally prefer making a
> top level .config.yml like the following:
>
> ```
> ---
> header:
>   version: 17
>   includes:
>     - kas/arago-scarthgap-config.yml
>
> machine: am62xx-evm
> target: core-image-minimal
> ```
Okay thanks, that's not too bad.
>
> > Note: The recent flutter config I guess is missing a blank line, so
> > rerunning the config make generates a git diff ...
> > $ git diff
> > diff --git a/kas/arago-scarthgap-flutter-config.yml
> > b/kas/arago-scarthgap-flutter-config.yml
> > index d131a8fa5f78..e5f901bf2bb5 100644
> > --- a/kas/arago-scarthgap-flutter-config.yml
> > +++ b/kas/arago-scarthgap-flutter-config.yml
> > @@ -76,3 +76,4 @@ repos:
> >      branch: "scarthgap"
> >      layers:
> >        meta:
> > +
> >
> > [snip]
>
> Yeah, second patch addresses that. Not entirely sure how/why there was a
> descrepency in whitespace to begin with. I may submit a followup patch to
> address yamllint warnings that I reported a while back.



--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

