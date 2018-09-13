Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5F7FA52A90
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 16:18:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DGIoip065870
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536855530;
	bh=cf3TZTzjt3rzFYgfRs6UXAyPraBa9U05ts+W3XGFPYs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=wlvZoQYyIvJrLYxMfhxy0ywJJqz8/Zm5AJxK6Ctd+OrCvlRyatMTad8WFSWHOcoUu
	DLfHppWI5F5jscydZWGybQuj1qRZ3Az20a+AcdJ7C12048lL02LDjP/ONvNwB/Pybo
	V7qbINKTwiO1Hclawz2y7TZ4k5J3vaynKwm0l2qA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIoHg027454
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 11:18:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 11:18:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 11:18:50 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DGIndD008111;
	Thu, 13 Sep 2018 11:18:49 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1536671773-7234-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <3bbbdec3-722c-02ca-f08e-a4b58889d4b1@ti.com>
Date: Thu, 13 Sep 2018 12:18:49 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536671773-7234-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [rocko][PATCH v2] packagegroup-arago-tisdk-matrix: new tidl examples added to package group
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
X-List-Received-Date: Thu, 13 Sep 2018 16:18:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to ti2018.03?


Thank you,

Jake


On 9/11/2018 9:16 AM, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index ea282d2..919bd41 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -161,6 +161,9 @@ MATRIX_APPS_append_dra7xx += " \
>       matrix-tidl-demo-staticimg \
>       matrix-tidl-demo-pnexamples \
>       matrix-tidl-demo-livecam \
> +    matrix-tidl-demo-livecam-lg2 \
> +    matrix-tidl-demo-staticimg-lg2 \
> +    matrix-tidl-demo-staticimg-dsponly \
>   "
>   
>   MATRIX_APPS_append_keystone = " \


