Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D9CB1529A6
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 20:11:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JKBnXJ001572
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:11:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JKBnRu027951
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:11:49 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Mon, 19 May 2014 15:11:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 13/19] packagegroup-arago-base-tiskd: Add
	base nfs-utils
Thread-Index: AQHPc5iwpYEwQlsEtESXNGecNNS0oZtIT7QA
Date: Mon, 19 May 2014 20:11:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
	<20140519192944.GE21819@edge>
In-Reply-To: <20140519192944.GE21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 13/19] packagegroup-arago-base-tiskd: Add base nfs-utils
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
X-List-Received-Date: Mon, 19 May 2014 20:11:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Monday, May 19, 2014 2:30 PM
>To: Maupin, Chase
>Cc: meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>tiskd: Add base nfs-utils
>
>On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin wrote:
>> * Add the base nfs-utils package along with the nfs-utils-client
>>   package.
>
>I asked it before, but don't remember seeing the answer - what's
>the purpose?
>Is there a use case for NFS server?

I can't find my reason now.  I'm going to remove it and do another test bui=
ld.  Maybe it was just a left over artifact.

>
>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../packagegroups/packagegroup-arago-base-tisdk.bb |    3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-
>distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
>> index 16b5df1..2db98b8 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-base-tisdk.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-base-tisdk.bb
>> @@ -1,6 +1,6 @@
>>  DESCRIPTION =3D "Additional packages beyond console packages
>shared by TI SDKs"
>>  LICENSE =3D "MIT"
>> -PR =3D "r13"
>> +PR =3D "r14"
>>
>>  inherit packagegroup
>>
>> @@ -16,5 +16,6 @@ RDEPENDS_${PN} =3D "\
>>      iperf \
>>      psplash \
>>      arago-gpl-notice \
>> +    nfs-utils \
>>      nfs-utils-client \
>>      "
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

