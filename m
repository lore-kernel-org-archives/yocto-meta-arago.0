Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6FE5152AC1
	for <meta-arago@arago-project.org>;
	Fri, 27 May 2016 08:09:55 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4R89o4a008474
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 03:09:50 -0500
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4R89opB025661
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 03:09:51 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4R89lSd012971
	for <meta-arago@arago-project.org>; Fri, 27 May 2016 13:39:49 +0530
Received: from [172.24.159.78] (172.24.159.78) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 May 2016 13:39:47 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1464262490-15361-1-git-send-email-a0393906@ti.com>
	<20160527020613.GC14462@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <574800CA.6000809@ti.com>
Date: Fri, 27 May 2016 13:39:46 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160527020613.GC14462@edge>
X-Originating-IP: [172.24.159.78]
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] weston-conf: set default backend to drm-backend
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
X-List-Received-Date: Fri, 27 May 2016 08:09:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 27-May-16 7:36 AM, Denys Dmytriyenko wrote:
> On Thu, May 26, 2016 at 05:04:50PM +0530, Karthik Ramanan wrote:
>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>> ---
>>   meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
>> index 615a604..4178ed3 100644
>> --- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
>> @@ -1,3 +1,6 @@
>> +[core]
>> +backend=drm-backend.so
> Isn't that the default?

The default backend is wayland-backend.so, since we have the WAYLAND_DISPLAY defined to wayland-0, the default backend will be wayland.
Source reference: https://cgit.freedesktop.org/wayland/weston/tree/src/main.c?h=1.9#n537

>
>
>>   [shell]
>>   locking=false
>>   animation=zoom
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


