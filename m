Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BC452520E2
	for <meta-arago@arago-project.org>;
	Wed, 25 Sep 2019 16:57:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PGuUUq027046
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 11:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569430590;
	bh=LoqSwBGm/+CCUrmeAMRO14rvDJLJ8qrWmhuPmNb6CmY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=VTWWvQZQ/Y93c1ImLEtoC6uDQHJTY6S5weed00FzJkffWkqjD2C7TSeZxwPjK/vRs
	vyBe6Y9BQqox2yquFrl0KdFVC7DS82VipxPEoZUPmnaQD6cpkBKgrpire8Y6bRwP3D
	gQPo0Jn4ri8JPuh0PHRIsJoDR0Hs8JcFlFbA5Sb4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PGuTIH087550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 11:56:30 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 11:56:29 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 11:56:22 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PGuTsd094445
	for <meta-arago@arago-project.org>; Wed, 25 Sep 2019 11:56:29 -0500
To: <meta-arago@arago-project.org>
References: <1569429391-8232-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6cc9e4f2-769f-f08c-3ede-28759bb01458@ti.com>
Date: Wed, 25 Sep 2019 12:56:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569429391-8232-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] packagegroup: matrix: remove ethernet submenu
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
X-List-Received-Date: Wed, 25 Sep 2019 16:57:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I forgot the branches in the subject. Can you apply this to master, 
thud, and ti2019.03?

Let me know if I should resubmit.


Thanks,

Jake

On 9/25/2019 12:36 PM, Jacob Stiffler wrote:
> * The ethernet submenu is the only submenu explicitly added to a
>    packagegroup.
> * submenus are RDEPENDS on the matrix apps, so adding here is
>    unnecessary.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> index c2c5975..1b57798 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
> @@ -1,6 +1,6 @@
>   DESCRIPTION = "Task to include Matrix v2"
>   LICENSE = "MIT"
> -PR = "r80"
> +PR = "r81"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -28,7 +28,6 @@ MATRIX_COMMON_APPS = "              \
>       matrix-gui-oprofile-demos       \
>       matrix-gui-settings-demos       \
>       matrix-gui-usb-demos            \
> -    matrix-gui-submenus-ethernet    \
>       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'matrix-gui-weston-terminal-demo', '', d)} \
>   "
>   

