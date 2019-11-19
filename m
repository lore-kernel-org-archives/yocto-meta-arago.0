Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D38CF52986
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2019 21:11:13 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJL9kbq013550
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 15:09:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574197786;
	bh=kA5qzFPUEpeapIprvHOzsni1RNJ27IW110AlMhxu+u0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ct+ywND2P2Om839WABqoD+sPI4qhYH0uobPcHq+34tKiVAbkuBDnHLEOQHYVQz2mh
	NUAvOSLVhlKO2BG4xOWZyWcWepUNphZ5/wX4zsCm/ZWIsX4ALlJFgnX4+30aKrLAmd
	G8XrilxrvTWBC7lWNjGkxxUFeSnJQXklP9Lzml14=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJL9kXC119555
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 15:09:46 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 19 Nov 2019 15:09:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 19 Nov 2019 15:09:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJL9kTS127281;
	Tue, 19 Nov 2019 15:09:46 -0600
Date: Tue, 19 Nov 2019 16:09:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20191119210945.GL27719@beryl>
References: <20191119203808.8050-1-e-ruei1@ti.com>
	<20191119205248.GI27719@beryl>
	<24b757f08cae4cfb90eaff15ff05c66e@ti.com>
MIME-Version: 1.0
In-Reply-To: <24b757f08cae4cfb90eaff15ff05c66e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [thud/master][PATCH] packagegroup-arago-*-qte-*: re-enable qtwebengine/webbrowser for AM6/J7
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
X-List-Received-Date: Tue, 19 Nov 2019 21:11:14 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, sounds good, I'll take the patch. Thanks.

On Tue, Nov 19, 2019 at 03:59:21PM -0500, Ruei, Eric wrote:
> Hi, Denys:
> 
> We do not force 4K page size. The qtwebengine will be included at the target file system and the  users need to reconfigure and rebuild kernel in order to use it.
> This qtwebengine issue will be documented as known issue with  workaround. I shall spend some time to figure out whether there is a simple solution for 64K page size.
> 
> Best regards,
> 
> Eric
>  
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, November 19, 2019 3:53 PM
> To: Ruei, Eric
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [thud/master][PATCH] packagegroup-arago-*-qte-*: re-enable qtwebengine/webbrowser for AM6/J7
> 
> So, how are you forcing 4K pages, when 64K is default on Aarch64?
> 
> 
> On Tue, Nov 19, 2019 at 03:38:08PM -0500, Eric Ruei wrote:
> > qtwebengine 5.11.3 and qtwebbrowser works on AM6/J7 when the page size
> > is set to 4K instead of 64K.
> > 
> > Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> > ---
> >  .../recipes-core/packagegroups/packagegroup-arago-qte.bb  | 6 +++---
> >  .../packagegroups/packagegroup-arago-tisdk-qte.bb         | 6 +++---
> >  .../packagegroup-arago-qte-toolchain-target.bb            | 8 ++++----
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > index b48b8c9f..5984fee7 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
> > @@ -50,9 +50,9 @@ QT5_ESSENTIALS = "\
> >  #QT5_ESSENTIALS_append_k3 = "\
> >  #    qtwebkit-qmlplugins \
> >  #"
> > -QT5_ESSENTIALS_remove_k3 = "\
> > -    qtwebengine-qmlplugins \
> > -"
> > +#QT5_ESSENTIALS_remove_k3 = "\
> > +#    qtwebengine-qmlplugins \
> > +#"
> >  
> >  RDEPENDS_${PN} = "\
> >      ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > index 09516693..f742c0f7 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
> > @@ -24,15 +24,15 @@ QT5_DEMOS = "\
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
> >      qtwebkit-examples-examples \
> >      qtwebengine-examples \
> > +    qtwebbrowser \
> > +    qtwebbrowser-examples \
> >      qtserialport-examples \
> >      qtcharts-examples \
> >  "
> >  
> >  #QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
> >  #
> > -QT5_DEMOS_remove_k3 = "\
> > -    qtwebengine-examples \
> > -"
> > +#QT5_DEMOS_remove_k3 = "\
> >  #    qtwebbrowser \
> >  #    qtwebbrowser-examples \
> >  #    qtwebengine-examples \
> > diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > index a90f56c0..ac3c6b13 100644
> > --- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
> > @@ -76,10 +76,10 @@ QT5_DEV = " \
> >  #        qtwebkit-dev \
> >  #"
> >  #
> > -QT5_DEV_remove_k3 = " \
> > -        qtwebengine-mkspecs \
> > -        qtwebengine-dev \
> > -"
> > +#QT5_DEV_remove_k3 = " \
> > +#        qtwebengine-mkspecs \
> > +#        qtwebengine-dev \
> > +#"
> >  
> >  RDEPENDS_${PN} += " \
> >          ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

