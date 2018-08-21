Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3939852B03
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:51:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJosv2048260
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:50:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534881054;
	bh=+ELzv9t1PfdIKXWexvVW9J5d/gTYNrLVpQfgPdNChP4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Xj6bNhiwUs5DK+UTjonUgZ2VgSvw/+VXd6T+38Oa+nxo37YehuslgM0Ka8QP1tZ36
	rjSv4w8b6ylqlKoZi800P+uOXTa0XZtG2nOAvSSZXH3WwHBS1GdD1E1IR4nFn92nPQ
	m1g1FHvqTR6H2L0IpL/w+WMtMH4b17paCT7o7fko=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJos7k022864
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:50:54 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:50:54 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:50:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJosJR019448;
	Tue, 21 Aug 2018 14:50:54 -0500
Date: Tue, 21 Aug 2018 15:49:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20180821194957.GR29422@beryl>
References: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
	<1534879768-59124-4-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534879768-59124-4-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/4] tisdk-roofs-image: add the GTK packagegroup
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
X-List-Received-Date: Tue, 21 Aug 2018 19:51:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 03:29:27PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> index e40dc1f..a86691d 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> @@ -9,6 +9,7 @@ IMAGE_INSTALL += "\
>      packagegroup-arago-test \
>      packagegroup-arago-test-addons \
>      ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
> +    packagegroup-arago-tisdk-gtk \

Since you made gtk+ dependent on egl, you probably also need to check sgx flag?


>      packagegroup-arago-tisdk-qte \
>      ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
>      ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

