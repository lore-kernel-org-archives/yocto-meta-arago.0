Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 31BCB52A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:00:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CE0bf1030511
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:00:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CE0ax3027693
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:00:36 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Thu, 12 Mar 2015 09:00:36 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add
	processor-sdk brand.
Thread-Index: AQHQXMPl+PTibaNGEEaABpIDaxT/cp0ZMwOA//+svQA=
Date: Thu, 12 Mar 2015 14:00:35 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F95814107DDB@DFLE09.ent.ti.com>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-5-git-send-email-j-stiffler@ti.com>
	<20150312135639.GC24885@edge>
In-Reply-To: <20150312135639.GC24885@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 4/4] branding-processor-sdk: Add processor-sdk brand.
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
X-List-Received-Date: Thu, 12 Mar 2015 14:00:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What would you suggest? That wayland be controlled as a feature from each b=
randing file? Or a new variable introduced that arago.conf can check to dec=
ide if wayland should be added to the DISTRO_FEATURES?

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, March 12, 2015 9:57 AM
To: Stiffler, Jacob
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 4/4] branding-processor-sdk: Add processor=
-sdk brand.

On Thu, Mar 12, 2015 at 08:55:57AM -0400, Jacob Stiffler wrote:
> * Set ARAGO_TISDK_IMAGE to "processor-sdk-linux-image"
> * For now, use sitara-linux-ti-staging
> * and remove wayland feature for ti33x and ti43x soc families.
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  .../conf/distro/include/branding-processor-sdk.inc |   35 ++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644=20
> meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
>=20
> diff --git=20
> a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc=20
> b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> new file mode 100644
> index 0000000..5eab952
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -0,0 +1,35 @@
> +ARAGO_TISDK_IMAGE =3D "processor-sdk-linux-image"
> +
> +# Remove wayland from ti33x and ti43x DISTRO_FEATURES.
> +DIRSTO_FEATURES_ti33x =3D "${@oe_filter_out('DISTRO_FEATURES', 'wayland'=
, d)}"
> +DIRSTO_FEATURES_ti43x =3D "${@oe_filter_out('DISTRO_FEATURES', 'wayland'=
, d)}"

Usually you want immediate assignment here. But I have my doubts it will wo=
rk reliably either way, when done like that...


> +PREFERRED_PROVIDER_virtual/kernel_am335x-evm =3D "sitara-linux-ti-stagin=
g"
> +PREFERRED_PROVIDER_virtual/kernel_am437x-evm =3D "sitara-linux-ti-stagin=
g"
> +PREFERRED_VERSION_sitara-linux-ti-staging =3D "3.14%"
> +
> +# To create newlines in the message \n is used and the slash must be esc=
aped
> +# to function properly
> +
> +SRCIPK_GIT_COMMIT_MESSAGE =3D "\
> +Create local branch\\n\
> +\\n\
> +The below commit is used for this local branch and is the one used by\\n=
\
> +this sdk:\\n\
> +${SRCREV}."
> +
> +SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE =3D"${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n=
\
> +To reduce the size of the SDK installer only a portion of the git commit=
\\n\
> +history has been preserved. Also links to remote branches and tags do\\n=
\
> +not exist in this copy of the repository.\\n\
> +To fix this please run the unshallow-repositories.sh\\n\
> +script located in the sdk\'s bin directory\\n\
> +\\n\
> +The script may take several minutes but you will then have a full copy o=
f\\n\
> +the git repository including its entire git history.\\n"
> +
> +SRCIPK_CUSTOM_GIT_BRANCH_pn-sitara-linux-ti-staging =3D "processor-sdk-1=
.0"
> +SRCIPK_CUSTOM_GIT_MESSAGE_pn-sitara-linux-ti-staging =3D "${SRCIPK_SHALL=
OW_GIT_COMMIT_MESSAGE}"
> +
> +SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging =3D "processor-sdk-1.0"
> +SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging =3D "${SRCIPK_GIT_COMMIT_=
MESSAGE}"
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

