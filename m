Return-Path: <subhajit_paul@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id DCDEA520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 17:51:57 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62HpC9J006784
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562089872;
	bh=zrjrP8pzT4U2z+SrqpoNnRKc1QFRUg7fPON+MBhUj5k=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ddUSAV+UvWdbYsBKK81NXJyMKxCoZh+NfFGI95tCddXlQQFCPUu6+OaeqKEK3aci4
	AL84bD8tTiJ87k5ouNGL0zSBzUQb6qPgUWPxrWwZvONQZZUlM92UzK2efmhtlVQk7B
	Olt77Zk2nJve1hQumVjl4ep2gHHI4rIENMEtu9nc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62HpCjf048596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:51:12 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 12:51:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 12:51:12 -0500
Received: from [172.24.145.210] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62HpAZ5110310;
	Tue, 2 Jul 2019 12:51:11 -0500
To: <meta-arago@arago-project.org>
References: <1562089568-27949-1-git-send-email-subhajit_paul@ti.com>
From: Subhajit Paul <subhajit_paul@ti.com>
Message-ID: <28977aba-e09e-4d74-e5d5-25ea8d34ae97@ti.com>
Date: Tue, 2 Jul 2019 23:20:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1562089568-27949-1-git-send-email-subhajit_paul@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] cadence-mhdp-fw: fix install location for firmware
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
X-List-Received-Date: Tue, 02 Jul 2019 17:51:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please ignore. Re-posted to meta-ti.

On 02/07/19 11:16 PM, Subhajit Paul wrote:
> Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
> ---
>   recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> index e8d5c54..a703272 100644
> --- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> +++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
> @@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
>   TARGET = "mhdp8546.bin"
>   
>   do_install() {
> -	install -d ${D}${base_libdir}/firmware
> -	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
> +	install -d ${D}${base_libdir}/firmware/cadence
> +	install -m 0644 ${S}/cadence/${TARGET} ${D}${base_libdir}/firmware/cadence/${TARGET}
>   }
>   
>   FILES_${PN} = "${base_libdir}/firmware"

