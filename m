Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D7A2552A07
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2013 13:08:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6GD8QHm012042;
	Tue, 16 Jul 2013 08:08:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6GD8PAi019508;
	Tue, 16 Jul 2013 08:08:25 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 16 Jul 2013 08:08:25 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Christian Gagneraud <chgans@gna.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] ofono broken with arago-danny-config (was Re:
	qt4-embedded-gles broken with arago-danny-config)
Thread-Index: AQHOfpWLgDRG4VBUjkOcJ0PwaZFlz5lnTWvA
Date: Tue, 16 Jul 2013 13:08:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596577EC@DLEE11.ent.ti.com>
References: <51DF4A26.6070407@gna.org> <51DF4BA2.7080408@gna.org>
In-Reply-To: <51DF4BA2.7080408@gna.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: ofono broken with arago-danny-config (was Re: qt4-embedded-gles broken with arago-danny-config)
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
X-List-Received-Date: Tue, 16 Jul 2013 13:08:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Christian Gagneraud
>Sent: Thursday, July 11, 2013 7:20 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] ofono broken with arago-danny-config (was
>Re: qt4-embedded-gles broken with arago-danny-config)
>
>Fixing the mail subject. Sorry about that.
>
>Chris
>
>On 12/07/13 12:13, Christian Gagneraud wrote:
>> Hi there,
>>
>> I've just updated my build env today because connman wouldn't
>compile
>> due to unmet dependencies on ofono (needed bluez >=3D4.99, had
>4.98),
>> and now it is solved, good!
>> Note: I updated my existing build env using "./oe-layertool-
>setup.sh
>> -f configs/arago-danny-config.txt"
>>
>> But now qt4-embedded-gles is broken:
>> christiaga@krys-red:~/projects/yocto/arago/build$ bitbake
>connman
>> ERROR: Unable to parse
>> /home/christiaga/projects/yocto/arago/sources/meta-arago/meta-
>arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.4.bb
>> Traceback (most recent call last):
>> [...]
>> OSError: [Errno 2] No such file or directory:
>> '/home/christiaga/projects/yocto/arago/sources/oe-
>core/meta/recipes-qt/qt4/qt4-4.8.4.inc'
>>
>> it seems that qt4-embedded-gles has been bumped to 4.8.4, but
>oe-core
>> is still at Qt 4.8.3.
>>
>> Then I realised, that I should as well update my arago build env
>using
>> git pull, and re-run ./oe-layertool-setup.sh, which I did, and
>now I'm
>> back on ofono/bluez unmet dependency...
>>
>> I tried to clean bluez4, connman and ofono and bitbake connman
>again,
>> but i get the same error while configuring ofono:
>> [...]
>> Requested 'bluez >=3D 4.99' but version of BlueZ is 4.98
>> | configure:13104: error: Bluetooth library >=3D 4.99 is required
>> [...]
>>

I think your issue is that the wireless connectivity team has set a preferr=
ed version for bluez4 to 4.98 in meta-arago-distro/conf/distro/include/arag=
o-prefs.inc.  They have some patches they append on top of bluez4 but have =
not updated to a later version.

Let's see if they have feedback here.  If you are not using the TI wireless=
 stack I would say just unset the PREFERRED_VERSION setting so you can pull=
 the latest bluez4 package.

>>
>> Am I missing something or is Arago temporary broken in that
>respect?
>>
>> Thx,
>> Chris
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

