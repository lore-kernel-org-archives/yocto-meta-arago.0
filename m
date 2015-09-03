Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0BFD5529D4
	for <meta-arago@arago-project.org>;
	Thu,  3 Sep 2015 14:53:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t83ErTYH024266
	for <meta-arago@arago-project.org>; Thu, 3 Sep 2015 09:53:29 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t83ErTPW025454
	for <meta-arago@arago-project.org>; Thu, 3 Sep 2015 09:53:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 3 Sep 2015 09:53:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t83ErSJM017270	for
	<meta-arago@arago-project.org>; Thu, 3 Sep 2015 09:53:28 -0500
Message-ID: <55E85EE8.5020806@ti.com>
Date: Thu, 3 Sep 2015 10:53:28 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
	<55DC6FC5.7090407@ti.com> <55DF0EEB.1060809@ti.com>
In-Reply-To: <55DF0EEB.1060809@ti.com>
Subject: Re: [PATCH v2 0/5] TI OpenCL
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
X-List-Received-Date: Thu, 03 Sep 2015 14:53:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping.

On 8/27/2015 9:21 AM, Jacob Stiffler wrote:
> Ping
>
> On 8/25/2015 9:38 AM, Jacob Stiffler wrote:
>> Ping.
>>
>> On 8/19/2015 9:58 AM, Jacob Stiffler wrote:
>>> This patch set provides the complte set of OpenCL packages for
>>> TI devices.
>>>
>>> v2 changes: Update descrption and homepage.
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
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>


