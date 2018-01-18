Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id BA10F529E6
	for <meta-arago@arago-project.org>;
	Thu, 18 Jan 2018 18:46:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0IIkN0s010048
	for <meta-arago@arago-project.org>; Thu, 18 Jan 2018 12:46:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516301183;
	bh=c6S85TIgRqKEXU5Wl38n2AGkh15kHJiVLbatCidlb0M=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=BABOlPcLs29Bwt1jpLXcSuKWwRF2GJq1ddWiapDk8/qgvoGsbrGITcxZgoVbzaP/8
	WouTPdDJPICMTxeVp8hZ/dvv+paAl73kuIJkAMPOTN278GUmpndBaPoMsK8GM3gQga
	kxLuE5SwOb3nVWJeieYmmlzSHagmzSL/tY8IbQAI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0IIkNis013917
	for <meta-arago@arago-project.org>; Thu, 18 Jan 2018 12:46:23 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 18 Jan 2018 12:46:23 -0600
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1261.035; Thu, 18 Jan 2018 12:46:23 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
	board-rtos: Skipping for incompatible architectures
Thread-Index: AQHTj+5VPwo2teeeVUmC4lqoiCNwqaN5+PPw
Date: Thu, 18 Jan 2018 18:46:23 +0000
Message-ID: <67fe8bd72294460b8fda1771e0276f87@ti.com>
References: <1516233176-55078-1-git-send-email-m-radhakrishnan2@ti.com>
In-Reply-To: <1516233176-55078-1-git-send-email-m-radhakrishnan2@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.254]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] board-rtos: Skipping for incompatible architectures
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
X-List-Received-Date: Thu, 18 Jan 2018 18:46:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please add PR_append =3D ".tisdk0" in the recipe.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Radhakrishnan, Mahesh
> Sent: Wednesday, January 17, 2018 6:53 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH]
> board-rtos: Skipping for incompatible architectures
>=20
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-bsp/board-rtos/board-rtos_git.bbappend | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
>=20
> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bbappend b/recipes-
> bsp/board-rtos/board-rtos_git.bbappend
> new file mode 100644
> index 0000000..0972f7c
> --- /dev/null
> +++ b/recipes-bsp/board-rtos/board-rtos_git.bbappend
> @@ -0,0 +1,2 @@
> +INSANE_SKIP_${PN} =3D "arch"
> +
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

