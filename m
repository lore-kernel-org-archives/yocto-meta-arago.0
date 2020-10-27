Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6B86452986
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 19:14:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RJBoxf065946
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 14:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603825910;
	bh=45gQOFRW39PDRXq4zZSfxY/7wW/nAzIiXpY1cIA5Or8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BPfbxZhBRE+n83kYPkSVTHl9/ixaXMLfzfZOEQQ43SSCsHK4nESjvfKwLS6hzSgob
	EjeW1azwZIhK3AoAjUR4O5GekIAQX1hD02aNDq3KZigJIsIYHON12svqh7Lh4RL0NL
	3Ypx5Lo0tdxTYLmEFG1qIU5IV2i2hdwPvBLIjdzs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RJBovq116446
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 14:11:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 14:11:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 14:11:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RJBnwH075216;
	Tue, 27 Oct 2020 14:11:49 -0500
Date: Tue, 27 Oct 2020 15:11:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
Message-ID: <20201027191149.GY19741@beryl>
References: <20201027024112.5330-1-s-anna@ti.com>
	<20201027024533.GR19741@beryl>
	<21098998-f191-b9f0-79af-26b1045c6a54@ti.com>
	<20201027040839.GS19741@beryl>
	<39ea11fd-e4bf-3133-b280-ece903a9b9f8@ti.com>
MIME-Version: 1.0
In-Reply-To: <39ea11fd-e4bf-3133-b280-ece903a9b9f8@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Tue, 27 Oct 2020 19:14:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 27, 2020 at 09:37:18AM -0500, Suman Anna wrote:
> Hi Denys,
> 
> On 10/26/20 11:08 PM, Denys Dmytriyenko wrote:
> > On Mon, Oct 26, 2020 at 09:48:26PM -0500, Suman Anna wrote:
> >> On 10/26/20 9:45 PM, Denys Dmytriyenko wrote:
> >>> On Mon, Oct 26, 2020 at 09:41:12PM -0500, Suman Anna wrote:
> >>>> Add the ti-rpmsg-char dev packages to make the public headers available in
> >>>> the target fileystem so that applications can be compiled natively on the
> >>>> target.
> >>>
> >>> -sdk-target is not for the target filesystem!
> >>> It is for the target sysroot in the devkit.
> >>
> >> Hmm, is this supposed to go into a different file or my patch description needs
> >> correcting?
> > 
> > It depends on what you actually need.
> 
> I want the files from the  ti-rpmsg-char-dev package (the public header files
> and libti_rpmsg_char.so) to be part of the FS tarball.

Then you need to pull corresponding -dev package into the packagegroup that 
builds up the rootfs.

At least in Arago, I kept the namespace convention that -sdk-target and 
-sdk-host suffixes are used to identify packagegroups for the devkit - 
cross-compile development environment on the host, target and host sysroots.


> regards
> Suman
> 
> > 
> > 
> >>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>> ---
> >>>>  .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 8 ++++++--
> >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>>> index e372dd67744e..b55c79a4d4df 100644
> >>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>>> @@ -1,6 +1,6 @@
> >>>>  DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
> >>>>  LICENSE = "MIT"
> >>>> -PR = "r43"
> >>>> +PR = "r44"
> >>>>  
> >>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>  
> >>>> @@ -143,7 +143,11 @@ UTILS_append_dra7xx = " can-utils-dev \
> >>>>                          elfutils-staticdev \
> >>>>  "
> >>>>  UTILS_append_k2g = " can-utils-dev"
> >>>> -UTILS_append_k3 = " can-utils-dev"
> >>>> +UTILS_append_k3 = "\
> >>>> +	can-utils-dev \
> >>>> +	ti-rpmsg-char-dev \
> >>>> +	ti-rpmsg-char-staticdev \
> >>>> +"
> >>>>  
> >>>>  EXTRA_LIBS = ""
> >>>>  EXTRA_LIBS_append_ti43x = "\
> >>>> -- 
> >>>> 2.28.0
> >>>>
> >>
> 

