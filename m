Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D13AF529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 14:46:18 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95EkIc5027878;
	Fri, 5 Oct 2012 09:46:18 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95EkIRb016683;
	Fri, 5 Oct 2012 09:46:18 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 09:46:17 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH] pulseaudio: Remove console-kit	from
	pulseaudio-module-server
Thread-Index: AQHNovw2v6pO1mXuEkuTfSWg+uXrOJeqymKP
Date: Fri, 5 Oct 2012 14:46:17 +0000
Message-ID: <3899093D-8619-4AE8-AC06-5FB555C8459C@ti.com>
References: <1349420150-22115-1-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED1015924817A@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015924817A@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] pulseaudio: Remove console-kit	from	pulseaudio-module-server
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
X-List-Received-Date: Fri, 05 Oct 2012 14:46:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No problem

On Oct 5, 2012, at 8:20 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote:

>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
>> Sent: Friday, October 05, 2012 1:56 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH] pulseaudio: Remove console-kit from
>> pulseaudio-module-server
>>=20
>> * Remove the required dependency of pulseaudio-module-console-kit
>>  when using pulseaudio-module-server. Pulseaudio-module-console-
>> kit
>>  brings in consolekit which can not be built in an non x11
>> environment.
>> * Due to X11 not being apart of the DISTRO_FEATURES, recipes such
>> as libx11
>>  and its dependencies aren't built able.
>=20
> I think you mean buildable
>=20
>> * pulseaudio-module-server is used by the bluetooth demo.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../pulseaudio/pulseaudio_2.1.bbappend             |    3 +++
>> 1 files changed, 3 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-distro/recipes-
>> multimedia/pulseaudio/pulseaudio_2.1.bbappend
>>=20
>> diff --git a/meta-arago-distro/recipes-
>> multimedia/pulseaudio/pulseaudio_2.1.bbappend b/meta-arago-
>> distro/recipes-multimedia/pulseaudio/pulseaudio_2.1.bbappend
>> new file mode 100644
>> index 0000000..0ddc49f
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-
>> multimedia/pulseaudio/pulseaudio_2.1.bbappend
>> @@ -0,0 +1,3 @@
>> +PR_append =3D "-arago0"
>> +
>> +RDEPENDS_pulseaudio-server :=3D "${@oe_filter_out('pulseaudio-
>> module-console-kit','${RDEPENDS_pulseaudio-server}', d)}"
>=20
> I know you commented in the commit message but any objection to commentin=
g this line directly in the recipe as well?
>=20
>> --
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

