Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0ABC4529A9
	for <meta-arago@arago-project.org>;
	Tue, 15 Oct 2019 17:15:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FHDrXm051335
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2019 12:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571159633;
	bh=LX0V32p2aCB0gFW+5kHn6sTzzg2tNSjSSddC9ijwnHk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=s7yV+gc3iIbnaCnFnxPzNl5ZTgw2DbLOGziupjsS/dB+/GSXQEsSyOR2Kkz51hy03
	zSGFa1KPzz90Flmaskr0R9Zn4hYgHhgTP2NjZ2+OZVdzv2tijfEOhjgzC28krV4I+Z
	g2LT5q4LPWTx3ZzBq2QujWBbbNVWLdhxfeeycoVw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FHDr6t071649
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2019 12:13:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 12:13:46 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 15 Oct 2019 12:13:46 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FHDqR0100588
	for <meta-arago@arago-project.org>; Tue, 15 Oct 2019 12:13:53 -0500
To: <meta-arago@arago-project.org>
References: <1571069457-2314-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e37f3bad-3d93-e2d0-6a77-f5f1bd1a1c56@ti.com>
Date: Tue, 15 Oct 2019 13:13:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571069457-2314-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud][PATCH] tisdk-server-rootfs-image: add packagegroup-arago-test-addons
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
X-List-Received-Date: Tue, 15 Oct 2019 17:15:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thank you,

Jake

On 10/14/2019 12:10 PM, Jacob Stiffler wrote:
> * This was missed when dropping tisdk-server-extra-rootfs-image.
> * See 6fd2672b9034d1bc5e4890924a70fdc4d4eb09b8
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> index 09d9f9d..7c52e39 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
> @@ -15,6 +15,7 @@ IMAGE_INSTALL += "\
>       packagegroup-arago-tisdk-matrix-extra \
>       packagegroup-arago-base-tisdk-server-extra \
>       packagegroup-arago-tisdk-connectivity \
> +    packagegroup-arago-test-addons \
>   "
>   
>   export IMAGE_BASENAME = "tisdk-server-rootfs-image"

