Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6D1415298C
	for <meta-arago@arago-project.org>;
	Tue, 13 Oct 2015 18:23:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9DINEso009025
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 13:23:14 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DINERX019920
	for <meta-arago@arago-project.org>; Tue, 13 Oct 2015 13:23:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 13:23:15 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9DINEQO016866;
	Tue, 13 Oct 2015 13:23:14 -0500
Message-ID: <561D4C13.80700@ti.com>
Date: Tue, 13 Oct 2015 14:23:15 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1444398420-20954-1-git-send-email-j-stiffler@ti.com>
	<20151013172150.GI28164@edge>
In-Reply-To: <20151013172150.GI28164@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] unshallow-repositories: Fix for 64-bit nativesdk
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
X-List-Received-Date: Tue, 13 Oct 2015 18:23:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/2015 1:21 PM, Denys Dmytriyenko wrote:
> On Fri, Oct 09, 2015 at 09:47:00AM -0400, Jacob Stiffler wrote:
>> * Use SDKMACHINE to obtain the location of the nativesdk git
>>    executable.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   .../unshallow-repositories/unshallow-repositories.sh                 | 2 +-
>>   .../unshallow-repositories/unshallow-repositories_1.0.bb             | 5 ++++-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
>> index f20a9b5..61bdb88 100755
>> --- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
>> +++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories/unshallow-repositories.sh
>> @@ -35,7 +35,7 @@
>>   install_dir="__SDK_INSTALL_DIR__"
>>   
>>   # Find git binary within the host native bin directory
>> -sdk_git_bin="$install_dir/linux-devkit/sysroots/i*/usr/bin/git"
> .../linux-devkit/sysroots/*86*-linux/usr/bin/git ?

That should work too. If that method is preferred, I'll send out a v2.

>
>> +sdk_git_bin="$install_dir/linux-devkit/sysroots/__SDKMACHINE__*/usr/bin/git"
>>   sdk_git_bin=`which $sdk_git_bin`
>>   
>>   if [ "$sdk_git_bin" = "" ]
>> diff --git a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
>> index f1ea414..12fd4f2 100644
>> --- a/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
>> +++ b/meta-arago-distro/recipes-tisdk/unshallow-repositories/unshallow-repositories_1.0.bb
>> @@ -4,12 +4,15 @@ LIC_FILES_CHKSUM = "file://../unshallow-repositories.sh;beginline=3;endline=19;m
>>   
>>   SRC_URI = "file://unshallow-repositories.sh"
>>   
>> -PR = "r0"
>> +PR = "r1"
>>   
>>   do_install () {
>>       install -d ${D}/
>>       install -d ${D}/bin
>>       install -m 0755 ${WORKDIR}/unshallow-repositories.sh ${D}/bin
>> +
>> +    sed -i -e "s|__SDKMACHINE__|${SDKMACHINE}|g" \
>> +        ${D}/bin/unshallow-repositories.sh
>>   }
>>   
>>   FILES_${PN} = "/*"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


