Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1FD6B529F9
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 18:32:27 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA5IWQMK016321;
	Mon, 5 Nov 2012 12:32:26 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA5IWQSx031820;
	Mon, 5 Nov 2012 12:32:26 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Mon, 5 Nov 2012 12:32:26 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 03/42] libjpeg-turbo: Mimic RPROVIDES fix
	from meta-oe master
Thread-Index: AQHNuvhk7u3ly0pqXE6V3N5AHrvjsZfb868A//+eLqQ=
Date: Mon, 5 Nov 2012 18:32:25 +0000
Message-ID: <5E961856-5523-41BB-B92E-EB70D61451C9@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>,
	<20121105182231.GF8311@edge>
In-Reply-To: <20121105182231.GF8311@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 03/42] libjpeg-turbo: Mimic RPROVIDES fix from meta-oe master
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
X-List-Received-Date: Mon, 05 Nov 2012 18:32:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The first two were patches I sent awhile ago. One was the creation of the c=
onnectivity task and the was ti-tisdk-setup

On Nov 5, 2012, at 12:22 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> I think some patches are missing. I counted only 40 out of 42 - #1 and #2=
 seem=20
> to be missing...
>=20
>=20
> On Sun, Nov 04, 2012 at 07:52:58PM -0600, Franklin S. Cooper Jr wrote:
>> * Add the changes incorporated by the patch
>>  "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg"
>>  currently applied to meta-oe master.
>> * When the above patch is applied to the denzil branch then this commit
>>  can be reverted.
>>=20
>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>> ---
>> .../recipes-core/jpeg/libjpeg-turbo_svn.bbappend   |    9 +++++++++
>> 1 files changed, 9 insertions(+), 0 deletions(-)
>> create mode 100644 meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn=
.bbappend
>>=20
>> diff --git a/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbapp=
end b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
>> new file mode 100644
>> index 0000000..08c085d
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-core/jpeg/libjpeg-turbo_svn.bbappend
>> @@ -0,0 +1,9 @@
>> +PRINC :=3D "${@int(PRINC) + 1}"
>> +
>> +# Temporarily add this append which incorporates the changes of meta-oe=
 master=20
>> +# patch "libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on =
jpeg"
>> +# commit id 662fd013adcbee8c59f4f475a11911c3267eae90.
>> +
>> +RPROVIDES_${PN}  +=3D "jpeg"
>> +RREPLACES_${PN}  +=3D "jpeg"
>> +RCONFLICTS_${PN} +=3D "jpeg"
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

