Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 85C4A529A7
	for <meta-arago@arago-project.org>;
	Thu,  5 Feb 2015 16:45:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t15GjjZq022797
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:45:45 -0600
Received: from DLEE51.ent.ti.com (dlee51.ent.ti.com [157.170.170.85])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t15Gji9h016977
	for <meta-arago@arago-project.org>; Thu, 5 Feb 2015 10:45:44 -0600
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE51.ent.ti.com ([fe80::240e:6c25:3382:183d%26]) with mapi id
	14.03.0224.002; Thu, 5 Feb 2015 10:45:44 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] sysvinit: Changing default setting to add
	HWCLOCKACCESS=no
Thread-Index: AQHQQV7/+cx4MOm97k+kVPwtLrsBfpziQKVA
Date: Thu, 5 Feb 2015 16:45:43 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C7F91C3@DFLE08.ent.ti.com>
References: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
In-Reply-To: <1423152936-3396-1-git-send-email-sam.nelson@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] sysvinit: Changing default setting to add	HWCLOCKACCESS=no
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
X-List-Received-Date: Thu, 05 Feb 2015 16:45:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see references to several boards that have enabled rtc in its dts file. I=
 didn't check all the boards we support in meta-ti but additional boards ma=
y use it. So we shouldn't disable it for these boards. Honestly if the erro=
r is harmless I would say just ignore it. Use some variable that will condi=
tional add that string depending on the machine if you want to disable it f=
or the machines you care about.

Honestly creating a file just to cat it's value to another file I feel is a=
 bit of an overkill especially since that file isn't generic and is meant f=
or hwclock. So just using echoing something would probably be better.

DISABLE_RTC =3D ""
DISABLE_<machine> =3D "yes"
....

do_install_append() {
	if [ "${DISABLE_RTC}" =3D "yes" ]
	then
		echo "#This is to indicate hwclock is not supported" >> ${D}${sysconfdir}=
/default/rcS
		echo "HWCLOCKACCESS=3Dno"
	fi
}


> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Thursday, February 05, 2015 10:16 AM
> To: meta-arago@arago-project.org
> Subject: [meta-arago] [PATCH] sysvinit: Changing default setting to add
> HWCLOCKACCESS=3Dno
>=20
> - realtime clock is not commonly present and hence adding
>   HWCLOCKACCESS=3Dno
> - Avoids error message if rc device not present
>=20
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  .../recipes-core/sysvinit/files/hwclock.rcS        |    2 ++
>  .../sysvinit/sysvinit_2.88dsf.bbappend             |    9 +++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/sysvinit/files/hwclock=
.rcS
>  create mode 100644 meta-arago-distro/recipes-
> core/sysvinit/sysvinit_2.88dsf.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS b/=
meta-
> arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> new file mode 100644
> index 0000000..3e26c20
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/sysvinit/files/hwclock.rcS
> @@ -0,0 +1,2 @@
> +# This is to indicate hwclock is not supported HWCLOCKACCESS=3Dno
> diff --git a/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bba=
ppend
> b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> new file mode 100644
> index 0000000..6e08c83
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/sysvinit/sysvinit_2.88dsf.bbappend
> @@ -0,0 +1,9 @@
> +PR_append =3D "-arago0"
> +
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +SRC_URI +=3D "file://hwclock.rcS"
> +do_install_append () {
> +# Add hwclock configuration
> +	cat ${WORKDIR}/hwclock.rcS >> ${D}${sysconfdir}/default/rcS }
> --
> 1.7.9.5
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

