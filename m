Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0BAC052987
	for <meta-arago@arago-project.org>;
	Tue, 18 Aug 2015 17:16:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7IHG2Td020505
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2015 12:16:02 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7IHG1Dj030755
	for <meta-arago@arago-project.org>; Tue, 18 Aug 2015 12:16:02 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 18 Aug 2015 12:16:01 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7IHG1ED001862;
	Tue, 18 Aug 2015 12:16:01 -0500
Message-ID: <55D36851.2030802@ti.com>
Date: Tue, 18 Aug 2015 13:16:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1439301710-31159-1-git-send-email-j-stiffler@ti.com>
	<20150812034226.GR30560@edge> <55CB2BF9.5070009@ti.com>
In-Reply-To: <55CB2BF9.5070009@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 0/5] TI OpenCL
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
X-List-Received-Date: Tue, 18 Aug 2015 17:16:03 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

On 8/12/2015 7:20 AM, Jacob Stiffler wrote:
>
>
> On 8/11/2015 11:42 PM, Denys Dmytriyenko wrote:
>> Thanks.
>>
>> 1. Is 3/5 missing?
> It was a large patch (>100KB) and is pending approval.
>> 2. Can you be more specific, as multiple recipes say "TI OpenCL" in
>> description.
> Do you mean that only the "DESCRIPTION" needs more specific 
> information? Or are there other areas too?
>
> If there are no other comments, I will go ahead and update.
>>
>>
>> On Tue, Aug 11, 2015 at 10:01:45AM -0400, Jacob Stiffler wrote:
>>> This patch set provides the complte set of OpenCL packages for TI 
>>> devices.
>>>
>>> Jacob Stiffler (5):
>>>    clocl: Add opencl kernel compiler.
>>>    opencl-monitor: Add opencl monitor firmware
>>>    ocl-gl-headers: Add GL headers required for opencl.
>>>    opencl: Add the opencl library
>>>    opencl-examples: Add the opencl examples.
>>>
>>>   meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |    34 +
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/gl.h          |  2235 ++++
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h   |  2311 ++++
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/glext.h       | 10776 
>>> +++++++++++++++++++
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/glx.h         |   513 +
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h  |    82 +
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/glxext.h      |  1001 ++
>>>   .../ocl/ocl-gl-headers/GL/internal/dri_interface.h |  1189 ++
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h      |   283 +
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/wglext.h      |   901 ++
>>>   .../recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h       |   140 +
>>>   .../recipes-ti/ocl/ocl-gl-headers_git.bb           |    25 +
>>>   meta-arago-extras/recipes-ti/ocl/ocl.inc           |    10 +
>>>   .../recipes-ti/ocl/opencl-examples_git.bb          |    77 +
>>>   .../recipes-ti/ocl/opencl-monitor_git.bb           |    58 +
>>>   meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |    55 +
>>>   16 files changed, 19690 insertions(+)
>>>   create mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glext.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glxext.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/internal/dri_interface.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wglext.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
>>>   create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
>>>   create mode 100644 
>>> meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
>>>   create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb
>>>
>>> -- 
>>> 1.9.1
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


