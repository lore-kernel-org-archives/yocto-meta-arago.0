Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 10074529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 14:45:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95EjKnQ012025;
	Fri, 5 Oct 2012 09:45:20 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95EjKNg015728;
	Fri, 5 Oct 2012 09:45:20 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 09:45:20 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+ dependencys
Thread-Index: AQHNosKOL5cBZzVY6kS/IDLpxozl7ZerBkGA///ET9c=
Date: Fri, 5 Oct 2012 14:45:19 +0000
Message-ID: <72FDF4EA-CA62-4179-AD66-9C6ADCA650E6@ti.com>
References: <1349420175-22159-1-git-send-email-fcooper@ti.com>,
	<7D46E86EC0A8354091174257B2FED10159248143@DLEE12.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159248143@DLEE12.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gst-plugins-bad: Remove gtk+ dependencys
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
X-List-Received-Date: Fri, 05 Oct 2012 14:45:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I did need two plugins that weren't being built but the main reason I did t=
his is to build as much plugins as possible instead of restricting it to so=
me fix list. As a SDK it makes sense to provide as much plugins as possible=
. We took the same approach in oe-classic.

So with that being said I am not sure what else u want me to add to that co=
mment.

On Oct 5, 2012, at 8:19 AM, "Maupin, Chase" <chase.maupin@ti.com> wrote:

>=20
> Can you clarify a bit why you needed to remove the --with-plugins setting=
s?  i.e. which plugins were not getting built that you needed?  A more deta=
iled comment would be useful.
>=20
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Franklin S. Cooper Jr
>> Sent: Friday, October 05, 2012 1:56 AM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH] gst-plugins-bad: Remove gtk+
>> dependencys
>>=20
>> * Disable rsvg and remove dependency to prevent gtk+ from being
>> pulled in.
>> * Remove the --with-plugins list to ensure all plugins are built.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../gstreamer/gst-plugins-bad_0.10.23.bbappend     |    8
>> ++++++++
>> 1 files changed, 8 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-distro/recipes-
>> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>>=20
>> diff --git a/meta-arago-distro/recipes-multimedia/gstreamer/gst-
>> plugins-bad_0.10.23.bbappend b/meta-arago-distro/recipes-
>> multimedia/gstreamer/gst-plugins-bad_0.10.23.bbappend
>> new file mode 100644
>> index 0000000..52739e4
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-multimedia/gstreamer/gst-plugins-
>> bad_0.10.23.bbappend
>> @@ -0,0 +1,8 @@
>> +PR_append =3D "-arago0"
>> +
>> +# Disable rsvg which caused gtk+ to be pulled in
>> +DEPENDS :=3D "${@oe_filter_out('librsvg','${DEPENDS}', d)}"
>> +EXTRA_OECONF +=3D "--disable-rsvg"
>> +
>> +# Build all the various plugins
>> +EXTRA_OECONF :=3D "${@oe_filter_out('--with-
>> plugins=3Dmusicbrainz,wavpack,ivorbis,mpegvideoparse','${EXTRA_OECO
>> NF}', d)}"
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

