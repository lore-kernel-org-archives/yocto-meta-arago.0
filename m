Return-Path: <paul.barker@konsulko.com>
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
	[209.85.161.66])
	by arago-project.org (Postfix) with ESMTPS id B15F3529EF
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 20:54:11 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id h10so77428ooi.10
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 12:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fqsPz0lZwCFRd9UFe/O5vB0wISSiqjbXuJ8n0vNmAy4=;
	b=Sg9qvIjHxjVrQvwQt6vjZyFqz+QhwtVhJyijrIG+z0JraBr7NII7mfQHOEdILULZhq
	nA5RVDqkVXtlP0kpwbeGHRUv6b6mOsIMrNifEK0QYLZjy0jFoAq/N1Tialf74G329Fle
	oIjVFfMzDUjpUaKnEoWn1MOWkD53KptXGPmoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fqsPz0lZwCFRd9UFe/O5vB0wISSiqjbXuJ8n0vNmAy4=;
	b=Qnc5S7Erd4jS3tMPVxELij3gdKAUUv7GXSWZPxUO1yeKaq+sY4o47tzjw+BOZjccAI
	3OH5suJ+V4TRenSkaRlwFRbKyNfz2o2PGMXjQGMJ3hgFPC14047Klb8+Ous6HS5ieCO0
	wek7rlGomMiTfeb2ZzgMIaIVrUvr9Zg9If/2/YBVA7uPf1pfxEBrZ3JZ91uupf8iN568
	3qB6fsdE6JyhCixWKQK9FJGfWATzHXP4IZdReSxT4xgi+Ihx7Jz51qSCP+F5sScdWauR
	6dIpVOtu61GoH4Lzj2s8XlfuINCtrbnu2I2gsEgz1Tp1xTudkFZG/R9DSBMo+Kr47peu
	WcNA==
X-Gm-Message-State: AOAM531Fd6hbJslANk4ImP3Z6FNHJDiuEVH1idKKIeB9lS0HrPdUMD2j
	nGN0a/u9SVnza9VhHj56Oto0SjxhdZ0WMw12zCTfBQ==
X-Google-Smtp-Source: ABdhPJyYeW6MtmM0uJj4gPIszJAFaGBdd7Ig0U6inFyY/XZuTqoBMFMio2O5oFt4gmky1gCmjczVGML+0BnW/OiYCrE=
X-Received: by 2002:a4a:83d7:: with SMTP id r23mr847774oog.5.1605214260805;
	Thu, 12 Nov 2020 12:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
	<bcf4433b6a8d4758a56eb570f1e84695@ti.com>
	<CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
	<3a19d70d925149708e184809dbdd83dc@ti.com>
	<CAM9ZRVuOJ84McAoidNPcEM+ZVq72TtN1c+gyb8LDHJ6KxJ43xA@mail.gmail.com>
	<2f6532709d5a41c3a8f25d11e5a29961@ti.com>
In-Reply-To: <2f6532709d5a41c3a8f25d11e5a29961@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 12 Nov 2020 20:50:50 +0000
Message-ID: <CAM9ZRVvLqchFB-xhfQxcebiVgGr6LXsjH-Lb9KV86kbQmyfLAg@mail.gmail.com>
To: "Tammana, Gowtham" <g-tammana@ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2020 20:54:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2020 at 20:20, Tammana, Gowtham <g-tammana@ti.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Paul Barker <pbarker@konsulko.com>
> >Sent: Thursday, November 12, 2020 12:28 PM
> >To: Tammana, Gowtham <g-tammana@ti.com>
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
> >demos: Allow empty package
> >
> >On Thu, 12 Nov 2020 at 17:42, Tammana, Gowtham <g-tammana@ti.com> wrote:
> >>
> >>
> >>
> >> >-----Original Message-----
> >> >From: Paul Barker <pbarker@konsulko.com>
> >> >Sent: Wednesday, November 11, 2020 10:56 AM
> >> >To: Tammana, Gowtham <g-tammana@ti.com>
> >> >Cc: meta-arago@arago-project.org
> >> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-
> >pm-
> >> >demos: Allow empty package
> >> >
> >> >On Fri, 6 Nov 2020 at 22:45, Tammana, Gowtham <g-tammana@ti.com> wrote:
> >> >>
> >> >>
> >> >>
> >> >> >-----Original Message-----
> >> >> >From: Paul Barker <pbarker@konsulko.com>
> >> >> >Sent: Friday, November 06, 2020 3:06 AM
> >> >> >To: Tammana, Gowtham <g-tammana@ti.com>
> >> >> >Cc: meta-arago@arago-project.org
> >> >> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-
> >gui-
> >> >pm-
> >> >> >demos: Allow empty package
> >> >> >
> >> >> >On Thu, 5 Nov 2020 at 22:54, Tammana, Gowtham <g-tammana@ti.com>
> >wrote:
> >> >> >>
> >> >> >> >-----Original Message-----
> >> >> >> >From: meta-arago-bounces@arago-project.org <meta-arago-
> >> >bounces@arago-
> >> >> >> >project.org> On Behalf Of Paul Barker
> >> >> >> >Sent: Thursday, November 05, 2020 4:38 AM
> >> >> >> >To: meta-arago@arago-project.org
> >> >> >> >Subject: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-
> >gui-
> >> >pm-
> >> >> >> >demos: Allow empty package
> >> >> >> >
> >> >> >> >The matrix-gui-pm-demos recipe splits its binaries into several
> >> >> >> >subpackages leaving the default package empty. The dependencies
> >for
> >> >the
> >> >> >> >default package are set so it makes sense to allow this empty
> >> >package
> >> >> >to
> >> >> >> >be created.
> >> >> >> >
> >> >> >> >Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >> >> >> >---
> >> >> >> > meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> >|
> >> >1 +
> >> >> >> > 1 file changed, 1 insertion(+)
> >> >> >> >
> >> >> >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >> >> >demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-
> >pm-
> >> >> >> >demos_2.0.bb
> >> >> >> >index 0116f5ea..a9ebb84f 100644
> >> >> >> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >demos_2.0.bb
> >> >> >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >demos_2.0.bb
> >> >> >> >@@ -10,6 +10,7 @@ S = "${WORKDIR}/git/power_apps"
> >> >> >> >
> >> >> >> > # Make sure power submenu and app images has been installed
> >> >> >> > RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-
> >power
> >> >> >> >matrix-gui-generic-pm"
> >> >> >> >+ALLOW_EMPTY_${PN} = "1"
> >> >> >>
> >> >> >> Just curious, I assume that the deployment of the dependent
> >packages
> >> >is
> >> >> >still
> >> >> >> ensured even without this change. This just makes it apparent to
> >the
> >> >> >user that
> >> >> >> the default package is empty. Or is it that the deployment of
> >> >dependent
> >> >> >packages
> >> >> >> is broken without this.
> >> >> >
> >> >> >Without this change the matrix-gui-pm-demos package is not created
> >and
> >> >> >cannot be installed.
> >> >>
> >> >> Yes, but as the package here is empty trying to understand why it
> >needs
> >> >to
> >> >> be installed in the first place.
> >> >>
> >> >> Now that the package is created, wondering if the dependencies with
> >the
> >> >> sub-packages needs to be listed as well something like
> >> >>
> >> >> RDEPENDS_${PN} += ${PN}-<subpackages} or
> >> >>
> >> >> RDEPENDS_${PN}-<subpackages> = ${PN}
> >> >
> >> >I'm not sure I understand your comment here. RDEPENDS_${PN} is set on
> >> >the line above my change. So effectively ${PN} is a packagegroup which
> >> >will install the listed dependencies. But without ALLOW_EMPTY being
> >> >set it won't be created.
> >> >
> >> >The other thing to consider is that ${PN} is a default dependency of
> >> >${PN}-dev and so not creating a ${PN} package can result in image
> >> >features like dev-pkgs breaking.
> >>
> >> The comment was for the dependencies for the sub-packages ${PN}-count
> >> and others here. I don't think ${PN} becomes a default dependency for
> >> sub-packages. Atleast the `opkg install` on sub-packages is not checking
> >> on the ${PN} dependencies. Given they are dependencies I reasoned that
> >> they can be added to the sub-packages with
> >>
> >> RDEPENDS-${PN}-count += ${PN}
> >>
> >> so that ${PN} listed dependencies are installed on installation of any of
> >> the sub-package which seems to be what the recipe wants.
> >>
> >> I see that this patch has been merged. This can be a separate patch. I
> >> can push this change if you would like me to.
> >
> >I guess you are describing a different issue here. Are the
> >dependencies listed in RDEPENDS_${PN} supposed to apply to the
> >subpackages?
>
> I think they are here.

Ok. That's completely outside my area of knowledge here so I think
you'll have to send a patch yourself for that.

-- 
Paul Barker
Konsulko Group

