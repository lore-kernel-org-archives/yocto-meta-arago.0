Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0ECA852A94
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2012 20:28:21 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qB6KSKhS023053
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 14:28:20 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qB6KSKeS008905
	for <meta-arago@arago-project.org>; Thu, 6 Dec 2012 14:28:20 -0600
Received: from dlelxv23.itg.ti.com (172.17.1.198) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 6 Dec 2012 14:28:20 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	qB6KSKfi008282;	Thu, 6 Dec 2012 14:28:20 -0600
Received: from dta0850405-ubuntu1 (dta0850405-ubuntu1.am.dhcp.ti.com
	[158.218.103.14])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id qB6KSJw27922;	Thu, 6 Dec 2012 14:28:19 -0600 (CST)
Received: from [127.0.0.1] (localhost [127.0.0.1])	by dta0850405-ubuntu1
	(Postfix) with ESMTP id 91938110604A;
	Thu,  6 Dec 2012 15:28:19 -0500 (EST)
Message-ID: <50C0FFE3.2090304@ti.com>
Date: Thu, 6 Dec 2012 15:28:19 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <50BFA673.6040800@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C342343@DFLE09.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] Define arago-test-image
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
X-List-Received-Date: Thu, 06 Dec 2012 20:28:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Franklin,

That's a fair point. I did it to keep some independence between the
arago-test and arago-tisdk images but I'm OK including
task-arago-tisdk-addons instead of task-arago-test-addons. I guess we
could separate into different task files only if needed in the future.

One task that will need to be added to task-arago-tisdk-addons is
bridge-utils.
bridge-utils is currently only included by task-arago-test-addons.

Let me know if you are OK adding bridge-utils and I can submit another
patch with these changes.

Thanks for the review,
Carlos

On 12/06/2012 02:30 PM, Cooper Jr., Franklin wrote:
> Can't task-arago-tisdk-addons be used instead of creating this new task-arago-test-addons recipe? The majority of the content in arago-test-addons is provided by task-arago-addons and the remainder is provided by tasks your pulling into the test image recipe. Other than having a slightly bloated file system with additional tools/libraries is there any reason you can't reuse some of the other tasks?
>
>> -----Original Message-----
>> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>> bounces@arago-project.org] On Behalf Of Hernandez, Carlos
>> Sent: Wednesday, December 05, 2012 1:54 PM
>> To: meta-arago@arago-project.org
>> Subject: [meta-arago] [PATCH] Define arago-test-image
>>
>> This filesystem image includes test appplications used by Linux validation team.
>>
>> Please consider it for meta-arago project. Thanks, Carlos
>>
>>
>>


