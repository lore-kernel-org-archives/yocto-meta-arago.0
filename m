Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id D675152A6D
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 14:03:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LE3oCd026312
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 09:03:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LE3n2p000632
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 09:03:50 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Wed, 21 May 2014 09:03:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Balasubramanian, Aparna" <aparnab@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 13/19] packagegroup-arago-base-tiskd: Add
	base nfs-utils
Thread-Index: AQHPc5iwpYEwQlsEtESXNGecNNS0oZtJPYbAgAIogYD//6x4cIAAASCw
Date: Wed, 21 May 2014 14:03:49 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D038F27@DLEE11.ent.ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
	<20140519192944.GE21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
	<537A6973.9000900@ti.com>
	<2A65B2F666A33943B1CA476CCB3F99FE0C36F48F@DFLE08.ent.ti.com>
	<20140521135825.GG21819@edge>
	<2A65B2F666A33943B1CA476CCB3F99FE0C36FF01@DFLE08.ent.ti.com>
In-Reply-To: <2A65B2F666A33943B1CA476CCB3F99FE0C36FF01@DFLE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
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
X-List-Received-Date: Wed, 21 May 2014 14:03:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Balasubramanian, Aparna
>Sent: Wednesday, May 21, 2014 9:03 AM
>To: Dmytriyenko, Denys
>Cc: Hernandez, Carlos; Maupin, Chase; meta-arago@arago-project.org
>Subject: RE: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>tiskd: Add base nfs-utils
>
>Correct and it did need the package - nfs-utils-client_* (example:
>nfs-utils-client_1.1.2-r10.6_armv
>7a.ipk).

My testing showed nfs-utils was not needed.  So I'm really not sure how I p=
icked this change up.  Please just ignore this patch.

>
>Regards,
>Aparna
>
>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, May 21, 2014 8:58 AM
>To: Balasubramanian, Aparna
>Cc: Hernandez, Carlos; Maupin, Chase; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>tiskd: Add base nfs-utils
>
>On Tue, May 20, 2014 at 06:03:10AM -0400, Balasubramanian, Aparna
>wrote:
>> Yes, I have a test case which checks whether following can be
>done from device under test.
>> root@xxxxx-evm:/sbin# mount -t nfs -o nolock
>xx.xxx.xxx.xx:/tftpboot
>> /mnt/testpoint
>
>So, isn't that an NFS client use case?
>
>
>> -----Original Message-----
>> From: Hernandez, Carlos
>> Sent: Monday, May 19, 2014 3:29 PM
>> To: Maupin, Chase
>> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org;
>Balasubramanian,
>> Aparna
>> Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>tiskd:
>> Add base nfs-utils
>>
>> On 05/19/2014 04:11 PM, Maupin, Chase wrote:
>> >> -----Original Message-----
>> >> >From: Dmytriyenko, Denys
>> >> >Sent: Monday, May 19, 2014 2:30 PM
>> >> >To: Maupin, Chase
>> >> >Cc:meta-arago@arago-project.org
>> >> >Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-
>base-
>> >> >tiskd: Add base nfs-utils
>> >> >
>> >> >On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin
>wrote:
>> >>> >>* Add the base nfs-utils package along with the nfs-utils-
>client
>> >>> >>   package.
>> >> >
>> >> >I asked it before, but don't remember seeing the answer -
>what's
>> >> >the purpose?
>> >> >Is there a use case for NFS server?
>> > I can't find my reason now.  I'm going to remove it and do
>another test build.  Maybe it was just a left over artifact.
>> >
>>
>> +Aparna
>> I believe one of the test cases is hosting a NFS server in the
>target.
>> Of course, one could argue that it should go in the test package
>group instead of base-tisdk.
>>
>>

