Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 13D9C529DC
	for <meta-arago@arago-project.org>;
	Fri, 23 Mar 2018 02:11:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2N2Bnku022730
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 21:11:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521771109;
	bh=bGQnP8vHeU+Uchfq9H7IaODJq6fA5rtWzFlYIBYV7tQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=aERMWRV+y6eC6OTi1GsNWCoHiCkJP7v9xKuTNr1gsAf4LbRjXcavvp0jbm4O7BK4K
	Y2M7ip2hrlSUtNziomldSu0l/JAApbzkS1Fb2bfqGDSHE93WOWKKL4Qbm1xOxCse9R
	TDERMbcOH6eCDQ/rrTJOpwaZZWKDe4XHRwIjzSG0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2N2Bngg018581
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 21:11:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 21:11:49 -0500
Received: from DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222]) by
	DFLE114.ent.ti.com ([fe80::bc90:ddd:2b87:4222%18]) with mapi id
	15.01.1261.035; Thu, 22 Mar 2018 21:11:49 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-processor-sdk][PATCH 1/2] linux-libc-headers: use latest
	processor-sdk-linux
Thread-Index: AQHTwec8mLKUNhy340SLCzy1y1AkHaPdFHVg
Date: Fri, 23 Mar 2018 02:11:49 +0000
Message-ID: <1f63d8df5e234577b4d88993de37d63a@ti.com>
References: <1521727089-14554-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1521727089-14554-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.109.201]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [meta-processor-sdk][PATCH 1/2] linux-libc-headers: use latest processor-sdk-linux
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
X-List-Received-Date: Fri, 23 Mar 2018 02:11:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NAK.

The ptp_clock.h change is minimal and we can avoid the change here by dupli=
cating in linuxptp.

> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Thursday, March 22, 2018 9:58 AM
> To: meta-arago@arago-project.org
> Cc: Ruei, Eric; Chengalvala, Vivek; Stiffler, Jacob
> Subject: [meta-processor-sdk][PATCH 1/2] linux-libc-headers: use latest
> processor-sdk-linux
>=20
> * This is needed for ptp_clock.h change
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb | 12
> ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 recipes-kernel/linux-libc-headers/linux-libc-
> headers_4.9.bb
>=20
> diff --git a/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
> b/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
> new file mode 100644
> index 0000000..7b9ba65
> --- /dev/null
> +++ b/recipes-kernel/linux-libc-headers/linux-libc-headers_4.9.bb
> @@ -0,0 +1,12 @@
> +require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +
> +PR_append =3D ".tisdk0"
> +
> +BRANCH =3D "processor-sdk-linux-04.03.00"
> +SRCREV =3D "b84a80dbbb9901f550a6bff7acbb956f7f18c515"
> +
> +KERNEL_GIT_URI =3D "git://git.ti.com/processor-sdk/processor-sdk-linux.g=
it"
> +KERNEL_GIT_PROTOCOL =3D "git"
> +SRC_URI =3D
> "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=3D${BRANCH
> }"
> +
> +S =3D "${WORKDIR}/git"
> --
> 2.7.4


