Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 4437E52092
	for <meta-arago@arago-project.org>;
	Fri,  9 Feb 2018 16:03:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w19G3d5Y013603
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 10:03:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518192219;
	bh=yTbuSEowDntvP/7lZtBf+linUrf0YZJxq368msHwHEU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=eqz/035SdczbhF3biibzdCnPZK7QlFpAc/FC5aAaBG+Ex8bwzVDPUuOtdCfss6XQz
	BZ5kY2i9GEcEO8q62vQN17kSTOjt2il0Mu+4P/lJSBt6TfwoF46yykwzwX55YnFMrG
	X8FSPbGRUB4YShxMOBnQsA0YJNjE5i9Khp4R2jSc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19G3dwL031181
	for <meta-arago@arago-project.org>; Fri, 9 Feb 2018 10:03:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 9 Feb 2018 10:03:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 9 Feb 2018 10:03:39 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w19G3c1F016041;
	Fri, 9 Feb 2018 10:03:39 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1518190522-46326-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <46835993-0fef-d46d-7700-7cb6fa3eb3e0@ti.com>
Date: Fri, 9 Feb 2018 11:03:38 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1518190522-46326-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] i2c-lld-rtos: Updating version & checksum
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
X-List-Received-Date: Fri, 09 Feb 2018 16:03:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 2/9/2018 10:35 AM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> index f46d2b6..d4da4ce 100644
> --- a/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> +++ b/recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
> @@ -4,4 +4,11 @@ DEPENDS_append_ti43x = " pruss-lld-rtos \
>   "
>   DEPENDS_append_am57xx-evm = " pruss-lld-rtos \
>   "
> +LIC_FILES_CHKSUM = "file://I2C.h;beginline=1;endline=32;md5=50084375278c1a2779571be134f98f7c"

Why did the license checksum change?

> +
> +I2C_LLD_SRCREV = "137c6c60d18a14629f1a7572fd87402716bd5104"
> +
> +PV = "01.00.00.10"
> +
>   INSANE_SKIP_${PN} = "arch"
> +


