Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by arago-project.org (Postfix) with ESMTPS id 9B2BC529C6
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 18:31:07 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id i18so6560290ots.0
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 10:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W2naqndHbizUI9h1Ww7CFBmGTkjbL+NHz86oB6lFfFM=;
	b=n+maOKlval756pWZt7ypjcC7TVuLoC1ojPLPXx3j/Hgkja60uGedzkmZYK/1v/jOjC
	g2PgDy57CP28YubFcbUhVpuaSD0WM/cJxy/5tiWyM6ickWLysfRsWpkp9NWNxgAAWLpv
	rgzlrcD2sV0EWMr8usK2vq/A9KZZnb2lYN6aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W2naqndHbizUI9h1Ww7CFBmGTkjbL+NHz86oB6lFfFM=;
	b=BUIDiHEZ9blIEkBv47A7Z6/S1mOeQRWQwowkx4emy4yguoMYTi0GrHJ6zZV2j0dUUm
	DJePtOJpRL8wFhUD04ewg/m6JCq98oCeymTb5uGrArSoCkL8pGalTt5XumCmfPlmXXco
	Om49d8Dk8lJX506Uqq8xROfMTKGzgO/8zkhQ3A3P0rJVpOIk6LgoEEMRForsl63kdAAd
	TfZvyoArstP3d0z9CRhSnK/csCXLDriTfaH64R+Gw4YYfETN7VvkrfWxIlLxyhobjIbP
	1r7rGC9zY2saw07eRFbHELBwaJDw35mKSlNupgYzlxDcLFU7lMSHuVHrK4asb+OK3HPH
	IhuA==
X-Gm-Message-State: AOAM53267QgbOyCYjQ0fgFIKFGcYXK0p2g1DfaympGD7oQ15huVq9Tgc
	63NUDq/CwtaLooHFMekV1wvPPqoHHEVI59BGD0PIXw==
X-Google-Smtp-Source: ABdhPJzw6Cj1kiILUKbvh30N0FgqEkOz7dbj3XSf6Pa/edBPmVGGSyk8sgIQmdNSv+vprdwrq+5rcmpB9IAe2FXJ6zA=
X-Received: by 2002:a05:6830:1b66:: with SMTP id
	d6mr402527ote.258.1605205676868; 
	Thu, 12 Nov 2020 10:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20201105103816.2865115-1-pbarker@konsulko.com>
	<a545abad45834306b42868c6987b11dd@ti.com>
	<CAM9ZRVsxSA04mVx08eeoMiWQNOCSDPE3bXhJW-Vn9HM43BzfcA@mail.gmail.com>
	<bcf4433b6a8d4758a56eb570f1e84695@ti.com>
	<CAM9ZRVt7Y1gZzCtTeO9d1tBnVg05OWY3pNYxyGNucxti-PwUtg@mail.gmail.com>
	<3a19d70d925149708e184809dbdd83dc@ti.com>
In-Reply-To: <3a19d70d925149708e184809dbdd83dc@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 12 Nov 2020 18:27:46 +0000
Message-ID: <CAM9ZRVuOJ84McAoidNPcEM+ZVq72TtN1c+gyb8LDHJ6KxJ43xA@mail.gmail.com>
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
X-List-Received-Date: Thu, 12 Nov 2020 18:31:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2020 at 17:42, Tammana, Gowtham <g-tammana@ti.com> wrote:
>
>
>
> >-----Original Message-----
> >From: Paul Barker <pbarker@konsulko.com>
> >Sent: Wednesday, November 11, 2020 10:56 AM
> >To: Tammana, Gowtham <g-tammana@ti.com>
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-pm-
> >demos: Allow empty package
> >
> >On Fri, 6 Nov 2020 at 22:45, Tammana, Gowtham <g-tammana@ti.com> wrote:
> >>
> >>
> >>
> >> >-----Original Message-----
> >> >From: Paul Barker <pbarker@konsulko.com>
> >> >Sent: Friday, November 06, 2020 3:06 AM
> >> >To: Tammana, Gowtham <g-tammana@ti.com>
> >> >Cc: meta-arago@arago-project.org
> >> >Subject: Re: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-
> >pm-
> >> >demos: Allow empty package
> >> >
> >> >On Thu, 5 Nov 2020 at 22:54, Tammana, Gowtham <g-tammana@ti.com> wrote:
> >> >>
> >> >> >-----Original Message-----
> >> >> >From: meta-arago-bounces@arago-project.org <meta-arago-
> >bounces@arago-
> >> >> >project.org> On Behalf Of Paul Barker
> >> >> >Sent: Thursday, November 05, 2020 4:38 AM
> >> >> >To: meta-arago@arago-project.org
> >> >> >Subject: [EXTERNAL] [meta-arago] [master/dunfell PATCH] matrix-gui-
> >pm-
> >> >> >demos: Allow empty package
> >> >> >
> >> >> >The matrix-gui-pm-demos recipe splits its binaries into several
> >> >> >subpackages leaving the default package empty. The dependencies for
> >the
> >> >> >default package are set so it makes sense to allow this empty
> >package
> >> >to
> >> >> >be created.
> >> >> >
> >> >> >Signed-off-by: Paul Barker <pbarker@konsulko.com>
> >> >> >---
> >> >> > meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb |
> >1 +
> >> >> > 1 file changed, 1 insertion(+)
> >> >> >
> >> >> >diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >> >demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >> >> >demos_2.0.bb
> >> >> >index 0116f5ea..a9ebb84f 100644
> >> >> >--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >demos_2.0.bb
> >> >> >+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-
> >demos_2.0.bb
> >> >> >@@ -10,6 +10,7 @@ S = "${WORKDIR}/git/power_apps"
> >> >> >
> >> >> > # Make sure power submenu and app images has been installed
> >> >> > RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power
> >> >> >matrix-gui-generic-pm"
> >> >> >+ALLOW_EMPTY_${PN} = "1"
> >> >>
> >> >> Just curious, I assume that the deployment of the dependent packages
> >is
> >> >still
> >> >> ensured even without this change. This just makes it apparent to the
> >> >user that
> >> >> the default package is empty. Or is it that the deployment of
> >dependent
> >> >packages
> >> >> is broken without this.
> >> >
> >> >Without this change the matrix-gui-pm-demos package is not created and
> >> >cannot be installed.
> >>
> >> Yes, but as the package here is empty trying to understand why it needs
> >to
> >> be installed in the first place.
> >>
> >> Now that the package is created, wondering if the dependencies with the
> >> sub-packages needs to be listed as well something like
> >>
> >> RDEPENDS_${PN} += ${PN}-<subpackages} or
> >>
> >> RDEPENDS_${PN}-<subpackages> = ${PN}
> >
> >I'm not sure I understand your comment here. RDEPENDS_${PN} is set on
> >the line above my change. So effectively ${PN} is a packagegroup which
> >will install the listed dependencies. But without ALLOW_EMPTY being
> >set it won't be created.
> >
> >The other thing to consider is that ${PN} is a default dependency of
> >${PN}-dev and so not creating a ${PN} package can result in image
> >features like dev-pkgs breaking.
>
> The comment was for the dependencies for the sub-packages ${PN}-count
> and others here. I don't think ${PN} becomes a default dependency for
> sub-packages. Atleast the `opkg install` on sub-packages is not checking
> on the ${PN} dependencies. Given they are dependencies I reasoned that
> they can be added to the sub-packages with
>
> RDEPENDS-${PN}-count += ${PN}
>
> so that ${PN} listed dependencies are installed on installation of any of
> the sub-package which seems to be what the recipe wants.
>
> I see that this patch has been merged. This can be a separate patch. I
> can push this change if you would like me to.

I guess you are describing a different issue here. Are the
dependencies listed in RDEPENDS_${PN} supposed to apply to the
subpackages?

-- 
Paul Barker
Konsulko Group

