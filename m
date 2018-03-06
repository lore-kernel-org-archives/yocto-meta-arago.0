Return-Path: <j-stiffler@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 59CC4529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 14:40:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26EdVWH013524
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 08:39:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520347171;
	bh=kgpQxOLIlgx/P2FeYMqhmY+fOysfnmppUMQAY3t5/so=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=xf1NKZJDeChwb9ozo+JNupLCK8/23h1+MhL9Fsfz5hNPetHw961r6uzgKB0PWJskv
	Zao8g2b2eh0i2JN5kJEsA73jVLQXV3r1RzUdse87lixtnAZVUhta6ZWjvaNC18MsoO
	8m6tS1ZYMljms9N4WihQ5GWjs+wlmaP1TvWIfnVc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26EdVAr015245
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 08:39:31 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 08:39:30 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 08:39:31 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26EdUCY031365;
	Tue, 6 Mar 2018 08:39:30 -0600
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1520290391-16288-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <940e8ee3-3d59-786c-b694-02794c0e0001@ti.com>
Date: Tue, 6 Mar 2018 09:39:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1520290391-16288-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] jailhouse-examples-rtos: Updating commit# and passing PDK_INSTALL_PATH
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
X-List-Received-Date: Tue, 06 Mar 2018 14:40:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed. Thank you.


On 3/5/2018 5:53 PM, Mahesh Radhakrishnan wrote:
> ---
>   recipes-support/jailhouse/jailhouse-examples-rtos_git.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
> index 2aaf302..2ffe853 100644
> --- a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
> +++ b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
> @@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/baremetal/soc/am572x/rules.mk;endline=
>   
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/processor-sdk/jailhouse-inmate.git;branch=${BRANCH}"
> -SRCREV = "384cdcde45c4170c31a0aef34ab1b03208ed52cb"
> +SRCREV = "607f8ab44ae4455a49238b6ee94d5bf5a7b7e24c"
>   
>   PV = "1.0"
> -PR = "r3"
> +PR = "r4"
>   
>   require recipes-ti/includes/tisdk-paths.inc
>   
> @@ -35,6 +35,7 @@ EXTRA_OEMAKE += "PDK_INSTALL_PATH=${PDK_INSTALL_DIR}/packages \
>                    PATH=${GCC_ARM_NONE_TOOLCHAIN}/bin:${PATH} \
>                    ROOT_DIR=${S} \
>   "
> +export PDK_INSTALL_PATH="${PDK_INSTALL_DIR}/packages"
>   
>   do_install() {
>       # Install the binary for Linux


