Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BAA4152987
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 19:46:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AJk43N009867
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557517564;
	bh=XO1GvlPwFld6eYsEvqv8QWTJqcQXNLWTlifhkrYzaeA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Du2lnUZw2PLMLYONacF63P/EdHoH2Dcx/ViEUGbmrBwZfOJwNBD7oPWxIOaPEe6u2
	cIBB7A3yq2IUCUTM+9FYlyxN4n1olYEgAxrmE3/nFHSWQ5eH6DKB3M0RRLop52i/lv
	/YipGOEfKwVG1xUCz/he14CkvnfWNDsZUqom0pgY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AJk4CJ067288
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 14:46:04 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 14:46:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 14:46:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AJk3t5082357;
	Fri, 10 May 2019 14:46:03 -0500
Date: Fri, 10 May 2019 15:46:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190510194603.GB8263@beryl>
References: <1557383279-18214-1-git-send-email-denys@ti.com>
	<4eee04f9-8c07-f8d9-9115-cf114cce6610@ti.com>
MIME-Version: 1.0
In-Reply-To: <4eee04f9-8c07-f8d9-9115-cf114cce6610@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [thud/master][PATCH v2 8/9] kernel-fitimage, arago.conf: introduce FITIMAGE_PACK_TEE
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
X-List-Received-Date: Fri, 10 May 2019 19:46:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

The reason for this change is that some platforms still build optee, but do 
not need to include it into the main FIT image. E.g. AM65x has optee included 
into U-boot. So, relying just on OPTEE* variables to trigger inclusion into 
FIT wasn't granular enough.

The other way around, just unsetting OPTEE* vars does not automatically 
disable building optee - you would still need to remove any package 
dependencies. Though if OPTEE* is unset, but FITIMAGE_PACK_TEE is enabled, 
it would trigger optee build and break. Not sure if it's a valid case, but 
we can add some checks to avoid this. Either way, the right approach here 
would be to not unset OPTEE* vars, but instead reset FITIMAGE_PACK_TEE.

-- 
Denys


On Fri, May 10, 2019 at 09:53:37AM -0400, Jacob Stiffler wrote:
> Denys,
> 
> We have been excluding optee by unsetting OPTEEMACHINE and OPTEEFLAVOR. Now
> with this change, will we instead need to set FITIMAGE_PACK_TEE = "0" for
> these machines?
> 
> 
> Thank you,
> 
> Jake
> 
> On 5/9/2019 2:27 AM, Denys Dmytriyenko wrote:
> >Instead of relying on OPTEEMACHINE and OPTEEFLAVOR, use FITIMAGE_PACK_TEE
> >to specify if packing OPTEE into FIT is required.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >v2 - revert setting only am4/am5/dra7 HS devices
> >
> >  meta-arago-distro/classes/kernel-fitimage.bbclass | 7 ++++---
> >  meta-arago-distro/conf/distro/arago.conf          | 4 ++++
> >  2 files changed, 8 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/classes/kernel-fitimage.bbclass b/meta-arago-distro/classes/kernel-fitimage.bbclass
> >index 9aa7640..34b61d0 100644
> >--- a/meta-arago-distro/classes/kernel-fitimage.bbclass
> >+++ b/meta-arago-distro/classes/kernel-fitimage.bbclass
> >@@ -1,6 +1,7 @@
> >  inherit kernel-uboot uboot-sign
> >  FITIMAGE_HASH_ALGO ?= "sha1"
> >+FITIMAGE_PACK_TEE ?= "0"
> >  FITIMAGE_DTB_BY_NAME ?= "0"
> >  FITIMAGE_TEE_BY_NAME ?= "0"
> >  FITIMAGE_CONF_BY_NAME ?= "0"
> >@@ -46,7 +47,7 @@ python __anonymous () {
> >              uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot') or 'u-boot'
> >              d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
> >-        if d.getVar('OPTEEMACHINE'):
> >+        if d.getVar('FITIMAGE_PACK_TEE') == "1":
> >              d.appendVarFlag('do_assemble_fitimage', 'depends', ' optee-os:do_deploy')
> >  }
> >@@ -323,7 +324,7 @@ fitimage_emit_section_config() {
> >  		setup_line="setup = \"setup@${5}\";"
> >  	fi
> >-	if [ -n "${6}" -a -n "${OPTEEFLAVOR}" ]; then
> >+	if [ -n "${6}" -a "x${FITIMAGE_PACK_TEE}" = "x1" ]; then
> >  		if [ "x${FITIMAGE_TEE_BY_NAME}" = "x1" ]; then
> >  			loadables_line="loadables = \"${6}.optee\";"
> >  			loadables_pager_line="loadables = \"${6}-pager.optee\";"
> >@@ -530,7 +531,7 @@ fitimage_assemble() {
> >  	#
> >  	# Step 2a: Prepare OP/TEE image section
> >  	#
> >-	if test -n "${OPTEEFLAVOR}"; then
> >+	if [ "x${FITIMAGE_PACK_TEE}" = "x1" ] ; then
> >  		mkdir -p ${B}/usr
> >  		rm -f ${B}/usr/${OPTEEFLAVOR}.optee
> >  		if [ -e "${DEPLOY_DIR_IMAGE}/${OPTEEFLAVOR}.optee" ]; then
> >diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> >index 7129202..5913d5b 100644
> >--- a/meta-arago-distro/conf/distro/arago.conf
> >+++ b/meta-arago-distro/conf/distro/arago.conf
> >@@ -38,6 +38,10 @@ IMAGE_FSTYPES += "tar.xz.md5"
> >  # FIT image for secure devices
> >  KERNEL_CLASSES += "kernel-fitimage"
> >  FITIMAGE_HASH_ALGO = ""
> >+FITIMAGE_PACK_TEE = "0"
> >+FITIMAGE_PACK_TEE_am437x-hs-evm = "1"
> >+FITIMAGE_PACK_TEE_am57xx-hs-evm = "1"
> >+FITIMAGE_PACK_TEE_dra7xx-hs-evm = "1"
> >  FITIMAGE_DTB_BY_NAME = "1"
> >  FITIMAGE_TEE_BY_NAME = "1"
> >  FITIMAGE_CONF_BY_NAME = "1"

