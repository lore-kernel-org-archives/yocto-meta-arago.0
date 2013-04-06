Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E4D9152AAC
	for <meta-arago@arago-project.org>;
	Sat,  6 Apr 2013 01:37:07 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r361b5si025438
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 20:37:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r361b5d8006941
	for <meta-arago@arago-project.org>; Fri, 5 Apr 2013 20:37:05 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 5 Apr 2013 20:37:05 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 5 Apr 2013 20:37:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tisdk-image: add support for DTB files
Thread-Index: AQHOMllIp2yymrr33ECmiGgA0UIcXZjIacms
Date: Sat, 6 Apr 2013 01:37:04 +0000
Message-ID: <8C41145C-47F2-478F-ADF3-A0229C36733A@ti.com>
References: <1365007710-12866-1-git-send-email-Chase.Maupin@ti.com>,
	<20130405235701.GH31233@denix.org>
In-Reply-To: <20130405235701.GH31233@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-image: add support for DTB files
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
X-List-Received-Date: Sat, 06 Apr 2013 01:37:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I was thinking that in the case you do want all dtb files you could set no =
filter and get them all.

Sincerely,
Chase Maupin
On Apr 5, 2013, at 6:57 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:

> On Wed, Apr 03, 2013 at 11:48:30AM -0500, Chase Maupin wrote:
>> * If DTB files exist add support for copying those files into
>>  the SDK prebuilt-images directory.
>> * The files to be copied can be controlled using the DTB_FILTER
>>  variable.
>>=20
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>> meta-arago-distro/classes/tisdk-image.bbclass |   10 ++++++++++
>> 1 files changed, 10 insertions(+), 0 deletions(-)
>>=20
>> diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-=
distro/classes/tisdk-image.bbclass
>> index a1ce1ad..4e3ed52 100644
>> --- a/meta-arago-distro/classes/tisdk-image.bbclass
>> +++ b/meta-arago-distro/classes/tisdk-image.bbclass
>> @@ -528,6 +528,16 @@ do_sdk_image () {
>>         return 1
>>     fi
>=20
> I was thinking of adding DTB_FILTER ?=3D "unknown" here, but then realize=
d it=20
> would just waste few cycles trying to find something in the deploy direct=
ory,=20
> which we can avoid completely by testing if it set or not...
>=20
>=20
>> +    # Copy the DTB files if they exist.
>> +    # NOTE: For simplicity remove the uImage- prefix on the dtb files. =
 Get just the symlink
>> +    #       files for a cleaner name.  Use the DTB_FILTER variable to a=
llow finding the
>> +    #       dtb files for only that MACHINE type
>=20
> Wrap the below for loop in "if [ -z "${DTB_FILTER}" ]; then" here?
>=20
>=20
>> +    for f in `find ${DEPLOY_DIR_IMAGE} -type l -name "*${DTB_FILTER}*.d=
tb"`
>> +    do
>> +        dtb_file=3D`basename $f | sed s/uImage-//`
>> +        cp $f ${prebuilt_dir}/${dtb_file}
>> +    done
>> +
>>     if [ "${SECONDARY_BOOTLOADER_NAME}" !=3D "" ]
>>     then
>>         # Copy the secondary bootloader image if it exists
>> --=20
>> 1.7.0.4
>>=20
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>=20

