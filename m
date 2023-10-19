Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E5CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 14:08:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.28680.1697724522258934976
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 07:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I3hVbTp+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39JE8cnb051840;
	Thu, 19 Oct 2023 09:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697724518;
	bh=cXaoHPn1OsE5Oql2hzTrK5Wcq3Io+cJOVQ4ERarZlqY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I3hVbTp+9WRcrzlv0/geDaqHi6JrO+vMWHfL18e1eWodk8jv1laMWaJxW9pL4Z2HQ
	 6njjqCB8mDkpjl4NR8oWIwBQsGA9cuwrsvI9wRZ7USF2A58iobWlSgYDdfy9K7xTl+
	 FIYstLrDXS6l8xq2VaXKqV2P3jGl4j8ilZXkaNgo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39JE8ci3031609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Oct 2023 09:08:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Oct 2023 09:08:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Oct 2023 09:08:37 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39JE8bc6032621;
	Thu, 19 Oct 2023 09:08:37 -0500
Message-ID: <5bf41e13-9dd8-419d-b14d-10e5c8083d5c@ti.com>
Date: Thu, 19 Oct 2023 09:08:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [master/kirkstone][PATCH v2] tisdk-bundle: bring
 this class on par with current image.bbclass
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20231019063335.3009239-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231019063335.3009239-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:08:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14956



On 10/19/2023 1:33 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> As tisdk-bundle was based on the image class long time ago, it inherited
> some of its old attributes and artifacts used back in the days. There
> were several updates and reworks done to this class through the years to
> keep it up to date and in sync with upstream image class, but some pieces
> fell through the cracks. In recent and not so recent years upstream image
> class have deprecated some things, changed and extended others, such as
> consolidated umask handling, improved sstate handling, expanded list of
> cleaned directories and changed stamping and locking policy.
> 
> Since tisdk-bundle inherits image class, corresponding attributes for
> do_rootfs, do_image and do_image_complete don't need to be modified here
> and can be left to their default values, as well as the order of those
> tasks.
> 
> This change addresses the issue with sstate/deploy file collisions we've
> been seeing at times lately resulting in pseudo abort errors. And it
> improves long term maintainability of tisdk-bundle class as well.

You are a rockstar, Denys.  Thank you.


> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> v2 - drop couple more lines
> 
>   meta-arago-distro/classes/tisdk-bundle.bbclass | 13 -------------
>   1 file changed, 13 deletions(-)
> 
> diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
> index 193181be..49504089 100644
> --- a/meta-arago-distro/classes/tisdk-bundle.bbclass
> +++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
> @@ -88,10 +88,6 @@ do_rootfs[depends] += "${@string_set('%s:do_image_complete' % pn for pn in (d.ge
>   do_rootfs[depends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN") or "").split())}"
>   do_rootfs[mcdepends] += "${@string_set('%s:do_populate_sdk' % pn for pn in (d.getVar("TISDK_TOOLCHAIN_K3R5") or "").split())}"
>   
> -do_rootfs[nostamp] = "1"
> -do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> -do_rootfs[cleandirs] += "${S}"
> -
>   # Call the cleanup_host_packages to remove packages that should be removed from
>   # the host for various reasons.  This may include licensing issues as well.
>   OPKG_POSTPROCESS_COMMANDS = "cleanup_host_packages; "
> @@ -132,9 +128,6 @@ fakeroot python do_image () {
>   
>       execute_pre_post_process(d, pre_process_cmds)
>   }
> -do_image[dirs] = "${TOPDIR}"
> -do_image[umask] = "022"
> -addtask do_image after do_rootfs before do_build
>   
>   fakeroot python do_image_complete () {
>       from oe.utils import execute_pre_post_process
> @@ -143,9 +136,6 @@ fakeroot python do_image_complete () {
>   
>       execute_pre_post_process(d, post_process_cmds)
>   }
> -do_image_complete[dirs] = "${TOPDIR}"
> -do_image_complete[umask] = "022"
> -addtask do_image_complete after do_image before do_build
>   
>   tisdk_image_setup () {
>       set -x
> @@ -345,6 +335,3 @@ tisdk_image_cleanup () {
>   license_create_manifest() {
>       :
>   }
> -
> -EXPORT_FUNCTIONS do_rootfs
> -addtask rootfs before do_build after do_install

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

