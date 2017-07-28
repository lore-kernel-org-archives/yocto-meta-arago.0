Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id DC377529EB
	for <meta-arago@arago-project.org>;
	Fri, 28 Jul 2017 13:26:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6SDQF2X026872
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 08:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501248375;
	bh=q9Zev3TxRHZxxVck1xwug/V8ONCejdiR6PvlUima+Ak=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=jMOmDwTUwQgcLNpQeqTkZOP21tCEst8oI46AWphulju4F7zzZa9/5aaPsHioFCyVT
	KKPtVzQHval5JBUVf6vnnx1HlGmBmxksjXACKNgvzgVGRbHc7yqaJCGHXQEe76tODE
	kDZbzB6zlrV7NYHFqjY8GOA9c+P2pD4DkRq5wEi4=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6SDQAEd019095
	for <meta-arago@arago-project.org>; Fri, 28 Jul 2017 08:26:10 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0294.000; Fri, 28 Jul 2017 08:26:10 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH 2/4]
	matix-gui-browser-demos: add browser demos
Thread-Index: AQHTBy/BGa1Cd0NJ9UGd3YU7lGOUTqJpO6Pw
Date: Fri, 28 Jul 2017 13:26:10 +0000
Message-ID: <009C030982313E4589C6BC55FBF1E82A25397039@DFLE09.ent.ti.com>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
	<1501194495-48938-3-git-send-email-e-ruei1@ti.com>
	<20170727232618.GR18367@edge>
In-Reply-To: <20170727232618.GR18367@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH 2/4] matix-gui-browser-demos: add browser demos
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
X-List-Received-Date: Fri, 28 Jul 2017 13:26:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, July 27, 2017 7:26 PM
To: Ruei, Eric
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [morty/master][PATCH 2/4] matix-gui-browser-demos=
: add browser demos

On Thu, Jul 27, 2017 at 06:28:13PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16=20
> ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644=20
> meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
>=20
> diff --git=20
> a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.b
> b=20
> b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.b
> b
> new file mode 100644
> index 0000000..63811c7
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2
> +++ .0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Various Demo Browsers for Matrix v2"

SUMMARY ^^^

[Eric] Yes, I shall change to SUMMARY.


> +HOMEPAGE =3D "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
> +
> +require matrix-gui-apps-git.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S =3D "${WORKDIR}/git/browser_apps"
> +
> +# Make sure browser submenu and app images has been installed=20
> +RDEPENDS_${PN} +=3D "matrix-gui-apps-images matrix-gui-submenus-browser"
> +
> +FILES_${PN} +=3D "${MATRIX_BASE_DIR}/*"
> +FILES_${PN} +=3D "${bindir}/runGoogleChrome.sh"
> --
> 1.9.1
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

