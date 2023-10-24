Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0267C07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 20:03:22 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.157655.1698177795667205938
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 13:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GDw6xXT4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39OK3DvS115230;
	Tue, 24 Oct 2023 15:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698177793;
	bh=Qs9cVGAJknT/hCPj8yW9y9hClVDaw6MKNLSN/ssT2jA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GDw6xXT472kaKDCM2CdukNpBTTYhaY4L2dVKXLsVVtsYIYC74eLtMarXwS87DM9Xy
	 +pWzlnY9lSUPslJkOdRGJwliynSNhXS8leBJNQIrnpTsl7b64vmMASZvArjpeT+fMS
	 AxkKV0uMuYvmg33m1OxPQSiGuKdHtTu2KEoyDSRU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39OK3DON018355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Oct 2023 15:03:13 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 24
 Oct 2023 15:03:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 24 Oct 2023 15:03:13 -0500
Received: from [10.249.38.142] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39OK3DKb051254;
	Tue, 24 Oct 2023 15:03:13 -0500
Message-ID: <f967e663-f079-4d2f-880e-db91b4a14778@ti.com>
Date: Tue, 24 Oct 2023 15:03:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone][PATCH 1/2] initscript-telnetd:
 Remove this package
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20231016211840.23815-1-afd@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20231016211840.23815-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Oct 2023 20:03:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14969


Someone brought up a good point on another patch.  Even though we 
configure Arago to be systemd BY DEFAULT.  The user can always choose 
switch over to sysvinit.  So we should probably leave this in until we 
decide not not support telnet anymore.


On 10/16/2023 4:18 PM, Andrew Davis wrote:
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../initscript-telnetd/initscript-telnetd.bb  | 18 ---------
>   .../initscript-telnetd/telnetd                | 40 -------------------
>   .../packagegroups/packagegroup-arago-base.bb  |  1 -
>   3 files changed, 59 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
>   delete mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> 
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> deleted file mode 100644
> index e492119b..00000000
> --- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION = "Initscripts for telnetd"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://telnetd;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
> -PR ="r1"
> -
> -SRC_URI = "file://telnetd"
> -
> -S = "${WORKDIR}"
> -
> -INITSCRIPT_NAME = "telnetd"
> -INITSCRIPT_PARAMS = "defaults 10"
> -
> -inherit update-rc.d
> -
> -do_install () {
> -	install -d ${D}${sysconfdir}/init.d/
> -	install -c -m 755 ${S}/telnetd ${D}${sysconfdir}/init.d/telnetd
> -}
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> deleted file mode 100644
> index a99f23ef..00000000
> --- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#! /bin/sh
> -#Permission is hereby granted, free of charge, to any person obtaining a copy
> -#of this software and associated documentation files (the "Software"), to deal
> -#in the Software without restriction, including without limitation the rights
> -#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> -#copies of the Software, and to permit persons to whom the Software is
> -#furnished to do so, subject to the following conditions:
> -#
> -#The above copyright notice and this permission notice shall be included in
> -#all copies or substantial portions of the Software.
> -#
> -#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> -#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> -#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> -#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> -#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> -#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> -#THE SOFTWARE.
> -
> -telnetd=/usr/sbin/telnetd
> -
> -test -x "$telnetd" || exit 0
> -
> -case "$1" in
> -  start)
> -    echo -n "Starting telnet daemon"
> -    start-stop-daemon --start --quiet --exec $telnetd
> -    echo "."
> -    ;;
> -  stop)
> -    echo -n "Stopping telnet daemon"
> -    start-stop-daemon --stop --quiet --exec $telnetd
> -    echo "."
> -    ;;
> -  *)
> -    echo "Usage: /etc/init.d/telnetd {start|stop}"
> -    exit 1
> -esac
> -
> -exit 0
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 1f63a7d0..5e528846 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -16,7 +16,6 @@ ARAGO_BASE = "\
>       mtd-utils \
>       mtd-utils-ubifs \
>       curl \
> -    initscript-telnetd \
>       ethtool \
>       thermal-init \
>       bash \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

