Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 93CC452985
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2019 21:56:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NLthKs034879
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 16:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556056543;
	bh=NkaXM6qLot5b6DU2VGAS+hB8GcGVdJIsaEa486m6yQM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WyOv3RxiIxlOlnAWS0oniaqmfIE/BSrqKFzrOwDbdu9Fmlokev43RdGRbqPxG/yVD
	rp6vMHdeHWsiVNhDN7LUe/mFzoFMcSWyK4Tx5E13zz7voPdCo78wQYreU0JBmvhnoP
	VC2jHhlVH1MUXWxTgaOwBThdvOL9shjIRQju3soQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NLthY2026108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 16:55:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 16:55:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 16:55:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NLtg0h064046;
	Tue, 23 Apr 2019 16:55:42 -0500
Date: Tue, 23 Apr 2019 17:55:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20190423215542.GC6705@beryl>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
	<128ca4ca-f51a-1732-2293-25e000b03a5e@ti.com>
	<20190423214510.GB6705@beryl>
	<63f92769-98d6-630a-340c-65c5077be1fc@ti.com>
MIME-Version: 1.0
In-Reply-To: <63f92769-98d6-630a-340c-65c5077be1fc@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Tue, 23 Apr 2019 21:56:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 23, 2019 at 05:49:31PM -0400, Andrew F. Davis wrote:
> On 4/23/19 5:45 PM, Denys Dmytriyenko wrote:
> > ERROR: QA Issue: optee-os: The LIC_FILES_CHKSUM does not match for file://.../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE;md5=69663ab153298557a59c67a60a743e5b
> > optee-os: Check if the license information has changed in .../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE to verify that the LICENSE value "BSD" remains valid [license-checksum]
> > 
> 
> LICENSE was changed in Feb, project is still BSD 2-Clause, new md5 is
> c1f21c4f72f372ef38a5a4aee55ec173
> 
> Andrew

Thanks!


Dan,

Would you be able to update the LIC_FILES_CHKSUM entry with the new hash?

Also, you seem to be using the wrong base - are you still on rocko? Should be 
using thud branch instead. It is already 3.4.0 in there:
http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-security/optee/optee-os_git.bbappend;hb=refs/heads/thud

Let me know if you'd rather prefer me to update it. Thanks.

-- 
Denys


> > On Tue, Apr 23, 2019 at 01:54:24PM -0500, Dan Murphy wrote:
> >> Andrew
> >>
> >> On 4/23/19 1:52 PM, Andrew F. Davis wrote:
> >>> On 4/23/19 2:40 PM, Dan Murphy wrote:
> >>>> +Andrew
> >>>>
> >>>> On 4/23/19 1:38 PM, Dan Murphy wrote:
> >>>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>>>> ---
> >>>>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
> >>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>>>> index 2204a50c..ee87b3c7 100644
> >>>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>>>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>>>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>>>>  
> >>>>>  PR_append = ".arago0"
> >>>>>  
> >>>>> -PV = "3.2.0+git${SRCPV}"
> >>>>> +PV = "3.5.0+git${SRCPV}"
> >>>
> >>> Might want to do the same for client/test, but they got tagged at 3.4.0,
> >>> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
> >>> to move them here, it should not be a problem.
> >>>
> >>
> >> Yeah rc1 was not tagged with these so rc2 we will update them
> >>
> >> Dan
> >>
> >>> Andrew
> >>>
> >>>>>  
> >>>>>  is_armv7 = "1"
> >>>>>  is_armv7_aarch64 = "0"
> >>>>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> >>>>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> >>>>>  "
> >>>>>  BRANCH = "ti_optee_os"
> >>>>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
> >>>>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
> >>>>>  
> >>>>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
> >>>>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
> >>>>>

