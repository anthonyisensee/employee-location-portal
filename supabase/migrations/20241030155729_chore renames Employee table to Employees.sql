revoke delete on table "public"."Employee" from "anon";

revoke insert on table "public"."Employee" from "anon";

revoke references on table "public"."Employee" from "anon";

revoke select on table "public"."Employee" from "anon";

revoke trigger on table "public"."Employee" from "anon";

revoke truncate on table "public"."Employee" from "anon";

revoke update on table "public"."Employee" from "anon";

revoke delete on table "public"."Employee" from "authenticated";

revoke insert on table "public"."Employee" from "authenticated";

revoke references on table "public"."Employee" from "authenticated";

revoke select on table "public"."Employee" from "authenticated";

revoke trigger on table "public"."Employee" from "authenticated";

revoke truncate on table "public"."Employee" from "authenticated";

revoke update on table "public"."Employee" from "authenticated";

revoke delete on table "public"."Employee" from "service_role";

revoke insert on table "public"."Employee" from "service_role";

revoke references on table "public"."Employee" from "service_role";

revoke select on table "public"."Employee" from "service_role";

revoke trigger on table "public"."Employee" from "service_role";

revoke truncate on table "public"."Employee" from "service_role";

revoke update on table "public"."Employee" from "service_role";

alter table "public"."LocationEvents" drop constraint "LocationEvents_employee_id_fkey";

alter table "public"."Employee" drop constraint "Employee_pkey";

drop index if exists "public"."Employee_pkey";

drop table "public"."Employee";

create table "public"."Employees" (
    "id" uuid not null default gen_random_uuid(),
    "first_name" text,
    "last_name" text
);


CREATE UNIQUE INDEX "Employee_pkey" ON public."Employees" USING btree (id);

alter table "public"."Employees" add constraint "Employee_pkey" PRIMARY KEY using index "Employee_pkey";

alter table "public"."LocationEvents" add constraint "LocationEvents_employee_id_fkey" FOREIGN KEY (employee_id) REFERENCES "Employees"(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."LocationEvents" validate constraint "LocationEvents_employee_id_fkey";

grant delete on table "public"."Employees" to "anon";

grant insert on table "public"."Employees" to "anon";

grant references on table "public"."Employees" to "anon";

grant select on table "public"."Employees" to "anon";

grant trigger on table "public"."Employees" to "anon";

grant truncate on table "public"."Employees" to "anon";

grant update on table "public"."Employees" to "anon";

grant delete on table "public"."Employees" to "authenticated";

grant insert on table "public"."Employees" to "authenticated";

grant references on table "public"."Employees" to "authenticated";

grant select on table "public"."Employees" to "authenticated";

grant trigger on table "public"."Employees" to "authenticated";

grant truncate on table "public"."Employees" to "authenticated";

grant update on table "public"."Employees" to "authenticated";

grant delete on table "public"."Employees" to "service_role";

grant insert on table "public"."Employees" to "service_role";

grant references on table "public"."Employees" to "service_role";

grant select on table "public"."Employees" to "service_role";

grant trigger on table "public"."Employees" to "service_role";

grant truncate on table "public"."Employees" to "service_role";

grant update on table "public"."Employees" to "service_role";


