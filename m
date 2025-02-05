Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 053D2C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 19:33:30 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.21754.1738784006078976840
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 11:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZazvQhjX;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515JXPYt3483030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 13:33:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738784005;
	bh=Xhoe46r2zYgHAkPPEaWE7lMCtekTK4/M4b6hgJMLMh8=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZazvQhjX6liCiE/e1mjyTdcehzVv4h5uFlhWifXpSiL6pI+/68zYb5dNwO7t4vRFd
	 zuaag38HCu5t//AWNMJD4TdUQzqK7KDUTVrzi9r2foW2f5q+tx3ofkKAUHC0Rp085O
	 Q7ZtG7B7qi0E8ww7EzYAGlMoQqxfNAW6twkMdGPI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515JXPat023546
	for <meta-arago@lists.yoctoproject.org>; Wed, 5 Feb 2025 13:33:25 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 13:33:25 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 13:33:24 -0600
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515JXOgc033894;
	Wed, 5 Feb 2025 13:33:25 -0600
Message-ID: <c249ea78-09ad-467d-816e-c3c65690e107@ti.com>
Date: Wed, 5 Feb 2025 13:33:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH v2] meta-arago-test: Add
 recipe for pytesseract
To: <a-christidis@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20250128205901.57080-1-a-christidis@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250128205901.57080-1-a-christidis@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 05 Feb 2025 19:33:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15812


It looks like there is already a version of pytesseract 0.3.13 available 
in meta-openembedded on master.

https://git.openembedded.org/meta-openembedded/tree/meta-python/recipes-extended/python-pytesseract

Can I drop this patch from master and just carry it on scarthgap?


On 1/28/2025 2:59 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@ti.com>
> 
> Recipe builds the python module pytessereact, version 0.3.13.
> 
> The module is a wrapper for Google's Tesseract-OCR engine.
> 
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../python3-pytesseract/pytesseract_0.3.13.bb    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> 
> diff --git a/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> new file mode 100644
> index 00000000..f63e9fd9
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/python3-pytesseract/pytesseract_0.3.13.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "Python-tesseract is a python wrapper for Google's Tesseract"
> +
> +DESCRIPTION = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."
> +
> +HOMEPAGE = "https://github.com/madmaze/pytesseract"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[sha256sum] = "4bf5f880c99406f52a3cfc2633e42d9dc67615e69d8a509d74867d3baddb5db9"
> +
> +PYPI_PACKAGE = "pytesseract"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND = "native"

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

