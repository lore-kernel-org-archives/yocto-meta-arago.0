Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2D2D0529D0
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 20:05:11 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARK50Hw002017
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 14:05:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543349100;
	bh=du7fUJFI5htJhu2dJM7bgLv45ZcyqfnsPuqRxsnSghk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TOOvDJclvlKeNXn0fgnj18IE7C9DsPjnUITILkNZCp/lp7QX8PcVVhwIKPYdlBKof
	/a9gr6cVyS5KJt4ay4ySefo2UBCnCO/DrhaRZtDTzCVePNmxAEIx5EFxXcdJ0MDIxM
	ffZFQOvWWTz5QhS1IRzXPINtonuz0kB05NFoHJuc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARK500C100523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 14:05:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 14:05:00 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 27 Nov 2018 14:05:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wARK4xb5019422;
	Tue, 27 Nov 2018 14:04:59 -0600
Date: Tue, 27 Nov 2018 15:04:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Su, Qin" <qsu@ti.com>
Message-ID: <20181127200459.GD29204@beryl>
References: <1542826913-4093-1-git-send-email-qsu@ti.com>
	<20181126221144.GI21933@beryl>
	<b8f61903377d478ebb3082a697acf773@ti.com>
MIME-Version: 1.0
In-Reply-To: <b8f61903377d478ebb3082a697acf773@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] arm-compute-library: bump SRCREV and add TI benchmark test group.
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
X-List-Received-Date: Tue, 27 Nov 2018 20:05:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Nov 27, 2018 at 03:00:22PM -0500, Su, Qin wrote:
> 
> 
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Monday, November 26, 2018 5:12 PM
> >To: Su, Qin
> >Cc: meta-arago@arago-project.org
> >Subject: Re: [meta-arago] [PATCH v2] arm-compute-library: bump SRCREV and
> >add TI benchmark test group.
> >
> >On Wed, Nov 21, 2018 at 02:01:53PM -0500, Qin Su wrote:
> >> updated to the latest version of 18.08 updated LIC_FILES_CHKSUM as
> >> Copyright time changed in LICENSE from 2017 to 2017-2018 updated to
> >> generate versioned library added benchmark preset group for squeezenet
> >> and inceptionnet
> >
> >Mostly looks good. 2 comments re: permissions and *.so below.

[snip]

> >> @@ -30,7 +43,7 @@ do_install() {
> >>      CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> >>
> >>      install -m 0755 -d ${D}${libdir}
> >> -    for lib in ${S}/build/*.so
> >> +    for lib in ${S}/build/*.so*
> >>      do
> >>          install -m 0755 $lib ${D}${libdir}
> >>      done
> >> @@ -43,16 +56,13 @@ do_install() {
> >>      # Install built source package as expected by ARMNN
> >>      install -d ${D}${datadir}/${BPN}
> >>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
> >> +    # Remove unneeded symlink .so
> >> +    rm -f ${D}${datadir}/${BPN}/build/*.so
> >
> >Why? They are useful for development and would automatically get packaged
> >into ${PN}-dev package...
> >
> These are the source files used by armnn. I did a clean up here with the change of 
> enabling the use of shared library in armnn patch v3
>  
> Replaced:
>     # Install built source package as expected by ARMNN
>     install -d ${D}${datadir}/${BPN}
>     cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
>     # Remove unneeded symlink .so
>     rm -f ${D}${datadir}/${BPN}/build/*.so
> 
> with:
>     # Install built source package as expected by ARMNN
>     install -d ${D}${datadir}/${BPN}
>     cp $CP_ARGS ${S}/arm_compute ${D}${datadir}/${BPN}/.
>     cp $CP_ARGS ${S}/include ${D}${datadir}/${BPN}/.
>     cp $CP_ARGS ${S}/support ${D}${datadir}/${BPN}/.

Ah, sorry, I misread your code above - you are correct, those are sources 
installed into ${datadir}. Yes, the new code is more clear about that. Thanks!


> >> -SOLIBS = ".so"
> >> -FILES_SOLIBSDEV = ""
> >>  INSANE_SKIP_${PN} = "ldflags"
> >>  INSANE_SKIP_${PN}-dev = "dev-elf ldflags"
> >>
> >> -PACKAGES =+ "${PN}-source"
> >> -FILES_${PN} += "${bindir}/*"
> >> -FILES_${PN} += "${libdir}/*.so"
> >>  FILES_${PN}-source = "${datadir}/${BPN}"
> >>  INSANE_SKIP_${PN}-source = "ldflags libdir staticdev"
> >>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> --
> >> 1.9.1
> >>
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

