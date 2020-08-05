Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 88F265297E
	for <meta-arago@arago-project.org>;
	Wed,  5 Aug 2020 20:59:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 075KuO1i095643
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2020 15:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596660984;
	bh=icpaveoqKyHaDOoZHODZrvC7Wkk0/WrAVmz7iIg82WM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bAcDVQAiEAsSDOA+pBb4vtyUu6cOqmTGtsoSlFZyNwAdmi8hdRcMrGXXHRYqMa+q3
	HZqmVcs5Th6jxX2F/jhQJ0HlGqiP/Qz3mTiryOIg1Sm6FIZ4FTrIFAOuUc8N9bF4fH
	zyRSQVYdJBWo5/SZhjtCvrklTEor3XORlfFULsl8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 075KuO9p040444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Aug 2020 15:56:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 5 Aug 2020 15:56:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 5 Aug 2020 15:56:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 075KuNrn052601;
	Wed, 5 Aug 2020 15:56:23 -0500
Date: Wed, 5 Aug 2020 16:56:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200805205623.GV14660@beryl>
References: <20200604000622.4119-1-g-tammana@ti.com>
	<20200710181804.GA12263@beryl>
MIME-Version: 1.0
In-Reply-To: <20200710181804.GA12263@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell][PATCH] wayland-ivi-extension: Update patch to weston-8
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
X-List-Received-Date: Wed, 05 Aug 2020 20:59:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping.

On Fri, Jul 10, 2020 at 02:18:04PM -0400, Denys Dmytriyenko wrote:
> Gowtham,
> 
> Looks like you renmaed the patch, but didn't update the recipe for the new 
> name:
> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.2.0.bb;hb=HEAD
> It now gives a warning about not being able to locate the patch.
> 
> Denys
> 
> 
> On Wed, Jun 03, 2020 at 07:06:22PM -0500, Gowtham Tammana wrote:
> > dunfell uses weston-8, update the ivi-id-agent dependencies patch to
> > use libweston-desktop-8.
> > 
> > Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> > ---
> >  ...i-id-agent-update-dependencies-to-build-on-weston-8.patch} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/{03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch => 03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch} (94%)
> > 
> > diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> > similarity index 94%
> > rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> > rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> > index 1b5f64e4..1b18d9bf 100644
> > --- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-7.patch
> > +++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension/03-ivi-id-agent-update-dependencies-to-build-on-weston-8.patch
> > @@ -1,7 +1,7 @@
> >  From b99082adfaf250b15f03345cdf1b433fb1575581 Mon Sep 17 00:00:00 2001
> >  From: Rajendraprasad K J <KarammelJayakumar.Rajendraprasad@in.bosch.com>
> >  Date: Mon, 6 Jan 2020 06:45:54 -0500
> > -Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 7
> > +Subject: [PATCH] ivi-id-agent: update dependencies to build on weston 8
> >  
> >  upgrade libweston-desktop version.
> >  
> > @@ -22,7 +22,7 @@ index 3e604a5..ff47808 100644
> >   pkg_check_modules(WESTON weston>=6.0.0 REQUIRED)
> >   pkg_check_modules(PIXMAN pixman-1 REQUIRED)
> >  -pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-6 REQUIRED)
> > -+pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-7 REQUIRED)
> > ++pkg_check_modules(LIBWESTON_DESKTOP libweston-desktop-8 REQUIRED)
> >   
> >   find_package(Threads REQUIRED)
> >   
> > -- 
> > 2.26.2
> > 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

