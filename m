Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6C4875299E
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2015 14:03:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t25E3WAP016784
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 08:03:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t25E3V6h025779
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2015 08:03:31 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Thu, 5 Mar 2015 08:03:31 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Thread-Topic: [meta-arago] [RFC 4/4] branding-processor-sdk: Add
	processor-sdk	branding.
Thread-Index: AQHQV0kOvhSJU+7F40esOWsOIHHb3Z0N68DG
Date: Thu, 5 Mar 2015 14:03:30 +0000
Message-ID: <B894E98B-FA71-44F9-9EB9-FA3FDF0D6E61@ti.com>
References: <1425562410-19688-1-git-send-email-j-stiffler@ti.com>,
	<1425562410-19688-5-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1425562410-19688-5-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC 4/4] branding-processor-sdk: Add processor-sdk	branding.
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
X-List-Received-Date: Thu, 05 Mar 2015 14:03:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable




> On Mar 5, 2015, at 7:34 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
>=20
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> .../conf/distro/include/branding-processor-sdk.inc |   34 +++++++++++++++=
+++++
> 1 file changed, 34 insertions(+)
> create mode 100644 meta-arago-distro/conf/distro/include/branding-process=
or-sdk.inc
>=20
> diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk=
.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> new file mode 100644
> index 0000000..d2e674e
> --- /dev/null
> +++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
> @@ -0,0 +1,34 @@
> +
> +# Override QT Platform with eglfs
> +ARAGO_QT_PLATFORM_ti33x =3D "eglfs"
> +ARAGO_QT_PLATFORM_ti43x =3D "eglfs"
Based on my previous comments the value set here will need to be tweaked.
> +
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

