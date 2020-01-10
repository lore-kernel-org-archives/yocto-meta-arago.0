Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DB61A529C0
	for <meta-arago@arago-project.org>;
	Fri, 10 Jan 2020 17:38:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00AHaUdM105732
	for <meta-arago@arago-project.org>; Fri, 10 Jan 2020 11:36:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578677790;
	bh=oaMtVGbCfAw1UK7aNhlwaJ+01gIn5dQNL+T/o6Uuzfc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=M0eF7H6ajcWXUq5i/xPSaq54RJdNIbe0y9dX8sNDXjz5tdcZTsFp9t73593NRF1ut
	smnTOeaYJKzBhlS0bTtdiBCM/BLXl4M58bn3ADqztAMBbdSCKUOYvEss1zvHHNHe4l
	i3p8HYQMNvo8MK3Pc5btJ2s5lYg58LjXjv2CxEQQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00AHaUoC066003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 Jan 2020 11:36:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 10 Jan 2020 11:36:30 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 10 Jan 2020 11:36:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00AHaUq0076510;
	Fri, 10 Jan 2020 11:36:30 -0600
Date: Fri, 10 Jan 2020 12:36:29 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhao (Compiler), Yuan" <yuanzhao@ti.com>
Message-ID: <20200110173629.GQ2305@beryl>
References: <20200108180412.117869-1-yuanzhao@ti.com>
	<20200109231143.GP2305@beryl>
	<aaa2988f9bdf4dfd95967cea6d6e6d6a@ti.com>
MIME-Version: 1.0
In-Reply-To: <aaa2988f9bdf4dfd95967cea6d6e6d6a@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Robey,
	Caleb" <c-robey@ti.com>
Subject: Re: [PATCH] tidl-api: update BBAI mcbench script
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
X-List-Received-Date: Fri, 10 Jan 2020 17:38:16 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, thanks, I'll take it.

On Thu, Jan 09, 2020 at 06:18:47PM -0500, Zhao (Compiler), Yuan wrote:
> No SRCREV bump yet.  The accepted commit stays on our internal develop 
> branch.  It will be externally visible next time we make a tidl-api release 
> (this one missed the PSDK 6.2 window).  - Yuan
> 
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, January 9, 2020 5:12 PM
> To: Zhao (Compiler), Yuan
> Cc: meta-arago@arago-project.org; Robey, Caleb
> Subject: Re: [meta-arago] [PATCH] tidl-api: update BBAI mcbench script
> 
> On Wed, Jan 08, 2020 at 12:04:12PM -0600, Yuan Zhao wrote:
> > Signed-off-by: Caleb Robey <a0232989@ti.com>
> > Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> > ---
> >  ...p-2-group-layer-use-cases-with-1-dsp.patch | 34 +++++++++++++++++++
> >  .../recipes-ti/tidl-api/tidl-examples_git.bb  |  3 +-
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> > 
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> > new file mode 100644
> > index 00000000..0c78ccf0
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/files/0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch
> > @@ -0,0 +1,34 @@
> > +tidl-api: replace 2 dsp + 2 group layer use cases with 1 dsp
> > +
> > +    The BBAI only has enough CMEM for 4 EVEs, 1 DSP, and 2 group
> > +    layers. In the case of all of our networks, the difference between
> > +    1 and 2 dsps is essentially nonexistent. (PLSDK-3189)
> > +
> > +Upstream-Status: Accepted
> 
> Since the patch is marked as "Accepted", shouldn't a simple SRCREV bump be 
> enough?
> 
> 
> > +Signed-off-by: Caleb Robey <a0232989@ti.com>
> > +Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
> > +---
> > + examples/mcbench/scripts/all_5729.sh | 9 ++++-----
> > + 1 file changed, 4 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/examples/mcbench/scripts/all_5729.sh b/examples/mcbench/scripts/all_5729.sh
> > +index defec72..0fee8a1 100755
> > +--- a/examples/mcbench/scripts/all_5729.sh
> > ++++ b/examples/mcbench/scripts/all_5729.sh
> > +@@ -7,8 +7,7 @@ export TIDL_NETWORK_HEAP_SIZE_DSP=56623104
> > + export TIDL_NETWORK_HEAP_SIZE_EVE=67108864
> > + export TIDL_NETWORK_HEAP_SIZE_DSP=8388608
> > + ./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> > +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> > +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> > +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > +-./mcbench -g 2 -d 2 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_mobileNet2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_2_224x224_multi.y
> > ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_inceptionNetv1_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > ++./mcbench -g 2 -d 1 -e 4 -c ../test/testvecs/config/infer/tidl_config_j11_v2_dense_lg2.txt -f 50 -i ../test/testvecs/input/preproc_0_224x224_multi.y
> > +-- 
> > +2.17.1
> > +
> > diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > index c7016ad5..e5afad1c 100644
> > --- a/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > +++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-examples_git.bb
> > @@ -6,7 +6,8 @@ LICENSE = "BSD"
> >  include tidl-api.inc
> >  require recipes-ti/includes/ti-paths.inc
> >  
> > -PR = "${INC_PR}.0"
> > +PR = "${INC_PR}.1"
> > +SRC_URI += "file://0002-replace-2-dsp-2-group-layer-use-cases-with-1-dsp.patch"
> >  
> >  COMPATIBLE_MACHINE = "dra7xx"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > -- 
> > 2.24.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

