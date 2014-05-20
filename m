Return-Path: <aparnab@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0EEBF52A0E
	for <meta-arago@arago-project.org>;
	Tue, 20 May 2014 10:03:13 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4KA3CHH030788
	for <meta-arago@arago-project.org>; Tue, 20 May 2014 05:03:12 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4KA3BtW019193
	for <meta-arago@arago-project.org>; Tue, 20 May 2014 05:03:12 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Tue, 20 May 2014 05:03:11 -0500
From: "Balasubramanian, Aparna" <aparnab@ti.com>
To: "Hernandez, Carlos" <ceh@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>
Thread-Topic: [meta-arago] [PATCH 13/19] packagegroup-arago-base-tiskd: Add
	base nfs-utils
Thread-Index: AQHPc6DpDzkSTxSutUSBOuTZ3OV79JtJPYbA
Message-ID: <2A65B2F666A33943B1CA476CCB3F99FE0C36F48F@DFLE08.ent.ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
	<20140519192944.GE21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
	<537A6973.9000900@ti.com>
In-Reply-To: <537A6973.9000900@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Jun 2014 15:53:33 +0000
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
Date: Tue, 20 May 2014 10:03:14 -0000
X-Original-Date: Tue, 20 May 2014 10:03:10 +0000
X-List-Received-Date: Tue, 20 May 2014 10:03:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, I have a test case which checks whether following can be done from dev=
ice under test.
root@xxxxx-evm:/sbin# mount -t nfs -o nolock xx.xxx.xxx.xx:/tftpboot /mnt/t=
estpoint
Thanks,
Aparna

-----Original Message-----
From: Hernandez, Carlos=20
Sent: Monday, May 19, 2014 3:29 PM
To: Maupin, Chase
Cc: Dmytriyenko, Denys; meta-arago@arago-project.org; Balasubramanian, Apar=
na
Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-tiskd: Add =
base nfs-utils

On 05/19/2014 04:11 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> >From: Dmytriyenko, Denys
>> >Sent: Monday, May 19, 2014 2:30 PM
>> >To: Maupin, Chase
>> >Cc:meta-arago@arago-project.org
>> >Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>> >tiskd: Add base nfs-utils
>> >
>> >On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin wrote:
>>> >>* Add the base nfs-utils package along with the nfs-utils-client
>>> >>   package.
>> >
>> >I asked it before, but don't remember seeing the answer - what's the=20
>> >purpose?
>> >Is there a use case for NFS server?
> I can't find my reason now.  I'm going to remove it and do another test b=
uild.  Maybe it was just a left over artifact.
>

+Aparna
I believe one of the test cases is hosting a NFS server in the target.
Of course, one could argue that it should go in the test package group inst=
ead of base-tisdk.



