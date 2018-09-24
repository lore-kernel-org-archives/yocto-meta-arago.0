Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0FAC75297F
	for <meta-arago@arago-project.org>;
	Mon, 24 Sep 2018 17:02:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8OH2U7M045825
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 12:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537808550;
	bh=mmKzaWN7uFixy2ciwf+aIGsjJuMkch4v52F3LiF5a7M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Tg9avN1bxy58n76ZaFTrV7NCnLAtwmbh1rCJiUwzqecIg6d0nng4wiqn4x0oPRGcr
	Xxs50uClwSiZVvVAJ3su8nA86gXuia1c/HdBqLfaOkUfidFoA/kqrLLPvgmuMLuYWn
	903/bTDZfFzeBBIWt7LH5ASA8TpQ7hmRxrVrTIiM=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8OH2UBs021802
	for <meta-arago@arago-project.org>; Mon, 24 Sep 2018 12:02:30 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 24 Sep 2018 12:02:29 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
	DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
	15.01.1466.003; Mon, 24 Sep 2018 12:02:30 -0500
From: "Senicic, Djordje" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko][PATCH 1/3] arm-compute-library: Add
	executables to the filesystem
Thread-Index: AQHUVCPkZEmWGcSZiU2Qd4HdQtdTkKT/p+BQ
Date: Mon, 24 Sep 2018 17:02:30 +0000
Message-ID: <a02db7c71f094780b1480871e87b6f49@ti.com>
References: <1537805152-4059-1-git-send-email-x0157990@ti.com>
	<20180924162909.GC18600@beryl>
In-Reply-To: <20180924162909.GC18600@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.218.103.75]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko][PATCH 1/3] arm-compute-library: Add executables to the filesystem
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
X-List-Received-Date: Mon, 24 Sep 2018 17:02:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was recreating flags the way they are set in image folder.
*.so  are actual shared libraries.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Monday, September 24, 2018 12:29 PM
To: Senicic, Djordje
Cc: meta-arago@arago-project.org; Senicic, Djordje
Subject: Re: [meta-arago] [rocko][PATCH 1/3] arm-compute-library: Add execu=
tables to the filesystem

On Mon, Sep 24, 2018 at 12:05:50PM -0400, Djordje Senicic wrote:
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  .../arm-compute-library/arm-compute-library_git.bb         | 14 ++++++++=
++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-co=
mpute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-librar=
y/arm-compute-library_git.bb
> index d9fa8b0..8a65ade 100644
> --- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
> +++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-l=
ibrary_git.bb
> @@ -29,20 +29,30 @@ LIBS +=3D "-larmpl_lp64_mp"
>  do_install() {
>      CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"
> =20
> -    install -d ${D}${libdir}
> +    install -m 0755 -d ${D}${libdir}
>      for lib in ${S}/build/*.so
>      do
> -        install -m 0644 $lib ${D}${libdir}
> +        install -m 0755 $lib ${D}${libdir}

Why do you make libraries executable?
BTW, are those *.so actual libraries or symlinks?


>      done
> =20
> +    # Install 'example' and benchmark executables
> +    install -d ${D}${bindir}
> +    find ${S}/build/examples/ -maxdepth 1 -type f -executable -exec cp $=
CP_ARGS {} ${D}${bindir} \;
> +    cp $CP_ARGS ${S}/build/tests/arm_compute_benchmark ${D}${bindir}
> +
>      # Install built source package as expected by ARMNN
>      install -d ${D}${datadir}/${BPN}
>      cp $CP_ARGS ${S}/. ${D}${datadir}/${BPN}
>  }
> =20
> +SOLIBS =3D ".so"
> +FILES_SOLIBSDEV =3D ""
> +INSANE_SKIP_${PN} =3D "ldflags"
>  INSANE_SKIP_${PN}-dev =3D "dev-elf ldflags"
> =20
>  PACKAGES =3D+ "${PN}-source"
> +FILES_${PN} +=3D "${bindir}/*"
> +FILES_${PN} +=3D "${libdir}/*.so"
>  FILES_${PN}-source =3D "${datadir}/${BPN}"
>  INSANE_SKIP_${PN}-source =3D "ldflags libdir staticdev"
>  INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> --=20
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

