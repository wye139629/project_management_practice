const axios = require('axios');

window.addEventListener("turbolinks:load",()=>{
  const endDate = document.querySelector(".end_date")
  const tableBody = document.querySelector("tbody")
  const temp = document.querySelector("template")


  function sortDate(){
    tableBody.innerHTML= ""
    axios.get("/tasks",{
      params:{
        taskEnd: "task_end"
      }
    })
    .then(function (response) {
      console.log(response.data);
      response.data.forEach((task)=>{
        renderTask(task)
      })
    })
    .catch(function (error) {
      console.log(error);
    })
  }
  function renderTask(task){
    const url = `/tasks/${task.id}/`
    const startDate = task.start_date.slice(0,10).replace(/-/g, "/")
    const endDate = task.end_date.slice(0,10).replace(/-/g, "/")
    const cloneTemp = document.importNode(temp.content, true)
    cloneTemp.querySelector(".task_edit").href = url + "edit"
    cloneTemp.querySelector(".task_delete").href = url
    cloneTemp.querySelector(".task_title").textContent = task.title
    cloneTemp.querySelector(".task_content").textContent = task.content
    cloneTemp.querySelector(".task_start_date").textContent = startDate
    cloneTemp.querySelector(".task_end_date").textContent = endDate
    tableBody.append(cloneTemp)
  }

  endDate.addEventListener("click",sortDate)
})
