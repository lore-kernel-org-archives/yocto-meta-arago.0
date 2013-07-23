Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A13C7529C9
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2013 17:42:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6NHg8O0006372
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:42:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6NHg8dP009907
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2013 12:42:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 12:42:08 -0500
Received: from [158.218.103.10] (a0850405-off1.am.dhcp.ti.com
	[158.218.103.10])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r6NHg8ew014792;	Tue, 23 Jul 2013 12:42:08 -0500
Message-ID: <51EEC070.8080402@ti.com>
Date: Tue, 23 Jul 2013 13:42:08 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1373040583-483-1-git-send-email-ceh@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E82D58B@DLEE08.ent.ti.com>
	<20130723171753.GR31158@edge>
In-Reply-To: <20130723171753.GR31158@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] packagegroup-arago-test: Add memtester
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
X-List-Received-Date: Tue, 23 Jul 2013 17:42:09 -0000
X-Groupsio-MsgNum: 1687
Content-Type: multipart/mixed; boundary="------------080703050701050100020109"

--------------080703050701050100020109
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

I submitted it last week, see attachment.

Carlos
On 07/23/2013 01:17 PM, Denys Dmytriyenko wrote:
> Ping.
>
> On Sat, Jul 06, 2013 at 01:56:38PM +0000, Dmytriyenko, Denys wrote:
>> PR bump?
>>
>>
>> Denys
>>
>>
>> -----Original Message-----
>> From: Hernandez, Carlos [ceh@ti.com]
>> Received: Friday, 05 Jul 2013, 12:09
>> To: meta-arago@arago-project.org [meta-arago@arago-project.org]
>> Subject: [meta-arago] [PATCH] packagegroup-arago-test: Add memtester
>>
>> memtester is a userspace utility for testing the memory subsystem.
>>
>> Signed-off-by: Carlos Hernandez <ceh@ti.com>
>> ---
>>   .../packagegroups/packagegroup-arago-test.bb       |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
>> index a52b84a..230b9af 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
>> @@ -15,6 +15,7 @@ ARAGO_TEST = "\
>>       rt-tests \
>>       evtest \
>>       bc \
>> +    memtester \
>>       "
>>
>>   ARAGO_TI_TEST = "\
>> --
>> 1.7.9.5
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------080703050701050100020109
Content-Type: message/rfc822;
	name="[meta-arago][PATCH v2] packagegroup-arago-test: Add memtester.eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="[meta-arago][PATCH v2] packagegroup-arago-test: Add memteste";
	filename*1="r.eml"

Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server id 14.2.342.3; Mon, 15 Jul 2013
 16:05:04 -0500
Received: from a0850405-off1 (a0850405-off1.am.dhcp.ti.com [158.218.103.10])
	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6FL5436019124	for
 <ceh@ti.com>; Mon, 15 Jul 2013 16:05:04 -0500
Received: from a0850405 by a0850405-off1 with local (Exim 4.76)	(envelope-from
 <a0850405@a0850405-off1>)	id 1Uypx9-0002X9-Rx; Mon, 15 Jul 2013 17:05:03
 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <arago-project.org@a0850405-off1>
CC: Carlos Hernandez <ceh@ti.com>
Subject: [meta-arago][PATCH v2] packagegroup-arago-test: Add memtester
Date: Mon, 15 Jul 2013 17:05:00 -0400
Message-ID: <1373922300-9705-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.7.9.5
Content-Type: text/plain
Return-Path: a0850405@a0850405-off1
X-MS-Exchange-Organization-AuthSource: DLEE70.ent.ti.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Mailbox: SYMANTEC;485425344;0;info
MIME-Version: 1.0

memtester is a userspace utility for testing the memory subsystem.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index a52b84a..41f6ba9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get System Test specific apps"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -15,6 +15,7 @@ ARAGO_TEST = "\
     rt-tests \
     evtest \
     bc \
+    memtester \
     "
 
 ARAGO_TI_TEST = "\
-- 
1.7.9.5


--------------080703050701050100020109--
