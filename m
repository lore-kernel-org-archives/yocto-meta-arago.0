Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 2A344529AD
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 21:40:46 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA7Lejxn002702;
	Wed, 7 Nov 2012 15:40:45 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA7LejRA003389;
	Wed, 7 Nov 2012 15:40:45 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 7 Nov 2012 15:40:45 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Franklin S. Cooper Jr"
	<fcooperjr27@gmail.com>
Thread-Topic: [meta-arago] [PATCH] shadow-securetty: Allow remote telnet
	login as root
Thread-Index: AQHNvSuXktSVTqIJskql1s+Nvfici5ffRfGA//+gJmA=
Date: Wed, 7 Nov 2012 21:40:44 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C31ABCD@DFLE09.ent.ti.com>
References: <1352322311-11941-1-git-send-email-fcooper@ti.com>
	<20121107212129.GH11967@edge>
In-Reply-To: <20121107212129.GH11967@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] shadow-securetty: Allow remote telnet login as root
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
X-List-Received-Date: Wed, 07 Nov 2012 21:40:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Wednesday, November 07, 2012 3:21 PM
To: Franklin S. Cooper Jr
Cc: meta-arago@arago-project.org; Cooper Jr., Franklin
Subject: Re: [meta-arago] [PATCH] shadow-securetty: Allow remote telnet log=
in as root

On Wed, Nov 07, 2012 at 03:05:11PM -0600, Franklin S. Cooper Jr wrote:
> * Need to add pts/X to the securetty file to allow remote login via=20
> telnet as root

Why do we need telnetd and specifically with root login? Isn't sshd not eno=
ugh? Previously telnetd was enabled because we couldn't ship sshd...

Franklin:
We still have some customers that want to use telnet to login into the syst=
em and some of our backend systems use telnet to login into to the system t=
o perform our testing.
=20
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../shadow/shadow-securetty_4.1.4.3.bbappend       |   15 ++++++++++++++=
+
>  1 files changed, 15 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-secu=
retty_4.1.4.3.bbappend
>=20
> diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4=
.1.4.3.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securett=
y_4.1.4.3.bbappend
> new file mode 100644
> index 0000000..a09c514
> --- /dev/null
> +++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.=
bbappend
> @@ -0,0 +1,15 @@
> +PR_append =3D "-arago0"
> +
> +do_install_append () {
> +    # Allow telnet sessions to login as root
> +    securetty_file=3D${D}${sysconfdir}/securetty
> +
> +    printf '\n' >> $securetty_file
> +    printf '# Allow 5 telnet login\n' >> $securetty_file
> +    printf 'pts/0\n' >> $securetty_file
> +    printf 'pts/1\n' >> $securetty_file
> +    printf 'pts/2\n' >> $securetty_file
> +    printf 'pts/3\n' >> $securetty_file
> +    printf 'pts/4\n' >> $securetty_file

You don't need to escape anything here, why not simply use "echo"?

> +
> +}
> --=20
> 1.7.0.4
>=20
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

