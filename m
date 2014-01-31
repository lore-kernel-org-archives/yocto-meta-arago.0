Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0475552A55
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 23:27:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0VNRa2k002689
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:27:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0VNRa2X014881
	for <meta-arago@arago-project.org>; Fri, 31 Jan 2014 17:27:36 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 31 Jan 2014 17:27:35 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] oe-layertool-setup.sh: avoid == bashism
Thread-Index: AQHPHtnM8ubdyzx/s0iyaUKZYL+xqZqfelcY
Date: Fri, 31 Jan 2014 23:27:35 +0000
Message-ID: <DF71B322-F679-47D5-B2B9-2E802D7E41B0@ti.com>
References: <1391129278-9755-1-git-send-email-denis@denix.org>,
	<20140131231133.GO6814@edge>
In-Reply-To: <20140131231133.GO6814@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] oe-layertool-setup.sh: avoid == bashism
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
X-List-Received-Date: Fri, 31 Jan 2014 23:27:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, fine by me
> On Jan 31, 2014, at 5:11 PM, "Dmytriyenko, Denys" <denys@ti.com> wrote:
>=20
> Ping. Any objections?
>=20
>=20
>> On Thu, Jan 30, 2014 at 07:47:58PM -0500, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>=20
>> Use POSIX "=3D" for comparison instead of bash "=3D=3D"
>>=20
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>> oe-layertool-setup.sh | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index ab66ef3..91fb71a 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -742,7 +742,7 @@ EOM
>>     fi
>>=20
>>     # If command line option was not set use the old dldir
>> -    if [ "x$dldir" =3D=3D "x" ]
>> +    if [ "x$dldir" =3D "x" ]
>>     then
>>         dldir=3D$old_dldir
>>     fi
>> --=20
>> 1.8.3.2
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

