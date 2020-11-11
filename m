Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by arago-project.org (Postfix) with ESMTPS id 5F42B52998
	for <meta-arago@arago-project.org>;
	Wed, 11 Nov 2020 16:59:44 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id m13so2886033oih.8
	for <meta-arago@arago-project.org>;
	Wed, 11 Nov 2020 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ybfe+w+l15sZaPwWjh2Ijryc9rmgmD0opZHRC8Cs5Qk=;
	b=pe7fd/XM+B1/o2T17SQjsxh1N8GSkPJESsp7rRsu4AbvKSTmaMtVovZ8GUMaEs4SqM
	LOh9v0KhsOYDr9lrhgZzJRitz53mOkHNguxxW/e24R5PYbNoWsBCLNO4MvECCydzRKlX
	vJ7QwLXnR5gUlke+FzDuQGr0Y2wCgPvT9EkbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ybfe+w+l15sZaPwWjh2Ijryc9rmgmD0opZHRC8Cs5Qk=;
	b=umMMNYzwoT2+UND4KMUALZqJvOuTopKLlNCRH0g5+L5BIxdPRO0EvKYOL4hSB3zx3j
	WIpmb03YO+srbHkjgJMyHmIMVFXYKd+a9Q4uWNkk4WPGyDBxZgNSc/aLmf/e7LiO5C8F
	hKm65byE8/XYlxRERYovcgjgP2qxcKFT1X4n1RQVaiivrBRxSrREiP4nVjc0AnMeRrNN
	EFt3WyvQMuCLJ9odVFvGOx0PTzxt7flb+RiRLfwSv09HLwIbk2uGWpq+s+rP9yPXFDwi
	7UleP9XSjKFKlBPc+HIYGlSaL+ef/k62+wUmgRO3b36GbAdkY7inplaz+U4k9wnFigDH
	0zGA==
X-Gm-Message-State: AOAM5312/Fv/b9oTeNtv8Nb/fWBj5YgP0N0BXWaH7k60WUpovaEHvWrZ
	7hzFF+VcW4pqQFNJj1Q7OvRj9Tt9i0B7X9Da1Ij9iw==
X-Google-Smtp-Source: ABdhPJxf7lMwNfunT3A2lIIMC4X5mFuN6D/dVE4X+X/SnaxaCoVY260kGn/oR85CHCHPKpk+ZEyWrgPI8vm37gbGVsI=
X-Received: by 2002:aca:c6cb:: with SMTP id w194mr2718402oif.27.1605113793671; 
	Wed, 11 Nov 2020 08:56:33 -0800 (PST)
MIME-Version: 1.0
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
	<bcf4433b6a8d4758a56eb570f1e84695@ti.com>
In-Reply-To: <bcf4433b6a8d4758a56eb570f1e84695@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Wed, 11 Nov 2020 16:56:23 +0000
Message-ID: <CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Nov 2020 16:59:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2020 at 22:45, Tammana, Gowtham <g-tammana@ti.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Paul Barker <pbarker@konsulko.com>
> >Sent: Friday, November 06, 2020 3:06 AM
> >To: Tammana, Gowtham <g-tammana@ti.com>
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
> >demos: Allow empty package
> >
> >On Thu, 5 Nov 2020 at 22:54, Tammana, Gowtham <g-tammana@ti.com> wrote:
> >>
> >> >-----Original Message-----
> >> >From: meta-arago-bounces@arago-project.org <meta-arago-bounces@arago-
> >> >project.org> On Behalf Of Paul Barker
> >> >Sent: Thursday, November 05, 2020 4:38 AM
> >> >To: meta-arago@arago-project.org
> >> >Subject: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
> >> >demos: Allow empty package
> >> >
> >> >The matrix-gui-pm-demos recipe splits its binaries into several
> >> >subpackages leaving the default package empty. The dependencies for the
> >> >default package are set so it makes sense to allow this empty package
> >to
> >> >be created.
> >> >
> >> >Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >> >---
> >> > meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb | 1 +
> >> > 1 file changed, 1 insertion(+)
> >> >
> >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >demos_2.0.bb
> >> >index 0116f5ea..a9ebb84f 100644
> >> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
> >> >@@ -10,6 +10,7 @@ S = "${WORKDIR}/git/power_apps"
> >> >
> >> > # Make sure power submenu and app images has been installed
> >> > RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power
> >> >matrix-gui-generic-pm"
> >> >+ALLOW_EMPTY_${PN} = "1"
> >>
> >> Just curious, I assume that the deployment of the dependent packages is
> >still
> >> ensured even without this change. This just makes it apparent to the
> >user that
> >> the default package is empty. Or is it that the deployment of dependent
> >packages
> >> is broken without this.
> >
> >Without this change the matrix-gui-pm-demos package is not created and
> >cannot be installed.
>
> Yes, but as the package here is empty trying to understand why it needs to
> be installed in the first place.
>
> Now that the package is created, wondering if the dependencies with the
> sub-packages needs to be listed as well something like
>
> RDEPENDS_${PN} += ${PN}-<subpackages} or
>
> RDEPENDS_${PN}-<subpackages> = ${PN}

I'm not sure I understand your comment here. RDEPENDS_${PN} is set on
the line above my change. So effectively ${PN} is a packagegroup which
will install the listed dependencies. But without ALLOW_EMPTY being
set it won't be created.

The other thing to consider is that ${PN} is a default dependency of
${PN}-dev and so not creating a ${PN} package can result in image
features like dev-pkgs breaking.

-- 
Paul Barker
Konsulko Group

